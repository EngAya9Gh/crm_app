//

import 'dart:ui' as myui;

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/chartmodel.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/utils/end_points.dart';

class report_rate extends StatefulWidget {
  const report_rate({Key? key}) : super(key: key);

  @override
  State<report_rate> createState() => _report_rateState();
}

class _report_rateState extends State<report_rate> {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  List<CommunicationModel> listInvoicesAccept = [];
  List<BarModel> salesresult = [];
  List<BarModel> salestempdataclientresult = [];
  List<DataRow> rowsdata = [];
  String iduser = '';
  bool loading = false;
  String type = 'date';
  String typeproduct = '1';
  double totalval = 0;

  DateTime _selectedDate = DateTime(1, 1, 1);
  DateTime _selectedDatemonth = DateTime(1, 1, 1);
  DateTime _selectedDatefrom = DateTime.now();
  DateTime _selectedDateto = DateTime.now();

  @override
  void initState() {
    super.initState();
    // getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    List<BarModel> tempdata = [];
    rowsdata.clear();
    UserModel usermodel =
        Provider.of<UserProvider>(context, listen: false).currentUser;
    String fkcountry = usermodel.fkCountry.toString();
    // String iduser = usermodel.idUser.toString();
    // String idregoin = usermodel.fkRegoin.toString();

    // if(Provider.of<privilge_vm>(context,listen: false)
    //     .checkprivlge('80')==true )
    //   paramprivilge='&id_user=${iduser}';
    // else {
    //   if(Provider.of<privilge_vm>(context,listen: false)
    //       .checkprivlge('81')==true )
    //     paramprivilge='&id_regoin=${idregoin}';
    // }
    // if(Provider.of<privilge_vm>(context,listen: false).checkprivlge('82')==true ||
    //     Provider.of<privilge_vm>(context,listen: false)
    //         .checkprivlge('80')==true||Provider.of<privilge_vm>(context,listen: false)
    //     .checkprivlge('81')==true){
    String params = '';
    if (typeproduct == '1') params = '&product=1';
    if (typeproduct == '2') params = '&product=2';
    if (typeproduct == '3') params = '&product=3';
    if (typeproduct == '4') params = '&product=4';
    if (typeproduct == '5') params = '&product=5';
    var data;

    switch (type) {
      case "userSum":
        data = await Api().post(
            url: EndPoints.baseUrls.url +
                "reports/report_care_rate.php?fk_country=$fkcountry$params",
            body: {'type': type});
        break;
      case "datedays":
        data = await Api().post(
            url: EndPoints.baseUrls.url +
                "reports/report_care_rate.php?fk_country=$fkcountry&from=${_selectedDatefrom.toString()}&to=${_selectedDateto.toString()}$params",
            body: {'type': type});
        break;
    }

    //userSum
    totalval = 0;
    listInvoicesAccept = [];
    for (int i = 0; i < data.length; i++) {
      listInvoicesAccept.add(CommunicationModel.fromJson(data[i]));
    }

    // for(int i=0;i<salesresult.length;i++)
    setState(() {
      salesresult = tempdata;
      // salestempdataclientresult = tempdataclient;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تقرير مستوى التقييم "),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('from'),
                    TextFormField(
                      validator: (value) {
                        if (_selectedDatefrom == DateTime(1, 1, 1)) {
                          return 'يرجى تعيين التاريخ ';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: kMainColor,
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        hintText: _selectedDatefrom == DateTime(1, 1, 1)
                            ? 'from' //_currentDate.toString()
                            : DateFormat('yyyy-MM-dd')
                                .format(_selectedDatefrom),
                        //_invoice!.dateinstall_task.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDatefrom(context, DateTime.now());
                        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                        //   getData();

                        // _selectDate(context, DateTime.now());
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('to'),
                    TextFormField(
                      validator: (value) {
                        if (_selectedDateto == DateTime(1, 1, 1)) {
                          return 'يرجى تعيين التاريخ ';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: kMainColor,
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        hintText: _selectedDateto == DateTime(1, 1, 1)
                            ? 'to' //_currentDate.toString()
                            : DateFormat('yyyy-MM-dd').format(_selectedDateto),
                        //_invoice!.dateinstall_task.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDateto(context, DateTime.now());
                      },
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 15.0,left: 15,top: 8,bottom: 8),
              //   child: Column (
              //     children: [
              //
              //     ],),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Consumer<selected_button_provider>(
                        builder: (context, selectedProvider, child) {
                      return GroupButton(
                          controller: GroupButtonController(
                            selectedIndex: selectedProvider.isbarsalestype,
                          ),
                          options: GroupButtonOptions(
                              buttonWidth: 40,
                              borderRadius: BorderRadius.circular(10)),
                          buttons: ['1', '2', '3', '4', '5', '-'],
                          onSelected: (_, index, isselected) {
                            switch (index) {
                              case 0:
                                typeproduct = '1';
                                break;
                              case 1:
                                typeproduct = '2';
                                break;
                              case 2:
                                typeproduct = '3';
                                break;
                              case 3:
                                typeproduct = '4';
                                break;
                              case 4:
                                typeproduct = '5';
                                break;
                              case 5:
                                typeproduct = '6';
                                break;
                            }
                            selectedProvider.selectValuebarsalestype(index);
                            if (_selectedDateto != DateTime(1, 1, 1) &&
                                _selectedDatefrom != DateTime(1, 1, 1))
                              getData();
                            //setState(() {
                            //typeinstallController=index.toString();

                            //  });
                          });
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عدد العملاء',
                      style: TextStyle(
                          fontFamily: kfontfamily2,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      listInvoicesAccept.length.toString(),
                      style: TextStyle(
                          fontFamily: kfontfamily2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Center(
                child: loading
                    ? CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                            // scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: listInvoicesAccept.length,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(30)),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 8.0,
                                                    color: Colors.black87
                                                        .withOpacity(0.2),
                                                  ),
                                                ],
                                                color: Colors.white30,
                                              ),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    //pushReplacement
                                                    Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                ProfileClient(
                                                                  idClient: listInvoicesAccept[
                                                                          index]
                                                                      .fkClient,
                                                                )));
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    //height: 70,//MediaQuery.of(context).size.height*0.15,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Flex(
                                                        direction:
                                                            Axis.vertical,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    listInvoicesAccept[
                                                                            index]
                                                                        .name_regoin
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        //fontWeight: FontWeight.bold,
                                                                        fontSize: 12,
                                                                        fontFamily: kfontfamily2,
                                                                        color: kMainColor),
                                                                  ),
                                                                  Text(
                                                                    listInvoicesAccept[index].rate ==
                                                                            null
                                                                        ? 'لم يتم التقييم بعد'
                                                                        : listInvoicesAccept[index]
                                                                            .rate
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        fontSize: 12,
                                                                        // fontWeight: FontWeight.bold,
                                                                        fontFamily: kfontfamily2,
                                                                        color: kMainColor),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text(
                                                                    listInvoicesAccept[
                                                                            index]
                                                                        .nameEnterprise
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          kfontfamily2,
                                                                    ),
                                                                  ),
                                                                  // Text(
                                                                  //   itemapprove.nameUser.toString(),
                                                                  //   style: TextStyle(fontFamily: kfontfamily2),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ]),
                      ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDatefrom(
      BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDatefrom = pickedDate;

        type = 'datedays';
        if (_selectedDateto != DateTime(1, 1, 1) &&
            _selectedDatefrom != DateTime(1, 1, 1)) getData();
      });
  }

  Future<void> _selectDateto(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        // initialEntryMode: DatePickerEntryMode.calendarOnly,
        // initialDatePickerMode: DatePickerMode.year,
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDateto = pickedDate;

        type = 'datedays';
        if (_selectedDateto != DateTime(1, 1, 1) &&
            _selectedDatefrom != DateTime(1, 1, 1)) getData();
      });
  }
}
