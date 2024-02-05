import 'dart:ui' as myui;

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';

class care_page_view extends StatefulWidget {
  care_page_view({Key? key}) : super(key: key);

  @override
  _care_page_viewState createState() => _care_page_viewState();
}

class _care_page_viewState extends State<care_page_view> {
  String? regoin;
  String? typeclientvalue;
  String? fkcountry;
  bool isloading = false;
  String type = 'wait';
  String typeproduct = '-';
  DateTime _selectedDatefrom = DateTime.now();
  DateTime _selectedDateto = DateTime.now();
  bool isMyClients = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  Future<void> getData() async {
    Provider.of<communication_vm>(context, listen: false).clear();
    String params = '';
    if (typeproduct == '1') params = '&product=1';
    if (typeproduct == '2') params = '&product=2';
    if (typeproduct == '3') params = '&product=3';
    if (typeproduct == '4') params = '&product=4';
    if (typeproduct == '5') params = '&product=5';

    final user = context.read<UserProvider>().currentUser;
    final userId = user.idUser;
    final fkCountry = user.fkCountry.toString();

    String myClientsParam = '';
    if (isMyClients) {
      myClientsParam = '&fk_user=$userId';
    }

    if (type == 'wait') {
      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationallrepeatpage(fkCountry, myClientsParam);
    } else {
      if (type == 'done') {
        String parmater =
            '$params$myClientsParam&from=${_selectedDatefrom.toString()}&to=${_selectedDateto.toString()}';
        Provider.of<communication_vm>(context, listen: false).getCommunicationallrepeatpage_done(fkCountry, parmater);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
      // Add Your Code here.
      // only
      Provider.of<selected_button_provider>(context, listen: false).selectValuebarsales(0, isInit: true);
      fkcountry = Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry.toString();
      //   Provider.of<communication_vm>(context, listen: false)
      //  .getCommunicationall('');
      //Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      // selectValuebarsalestype(index)
      Provider.of<selected_button_provider>(context, listen: false).selectValuebarsalestype(5);
      // Provider.of<client_vm>(context, listen: false)
      //   .getallclient();

      // await Provider.of<client_vm>(context, listen: false)
      //     .get_byIdClient(widget..toString());

      // await Provider.of<ClientProvider>(context, listen: false).getclient_Local('مشترك');
      getData();
      // if(Provider.of<selected_button_provider>(context, listen: false).isbarsales == 1 ) {
      //   type='done';
      //   getData();
      //
      // }else if(Provider.of<selected_button_provider>(context, listen: false).isbarsales == 0) {
      //   type='wait';
      //   getData();
      //
      // }
      // care/getcomm_repeat.php

      // Provider.of<invoice_vm>(context)
    });
    super.initState();
  }

  List<CommunicationModel> listCommunication = [];

  @override
  Widget build(BuildContext context) {
    listCommunication = Provider.of<communication_vm>(context, listen: true).listCommunicationrepeat;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'العناية بالعملاء',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView(
                children: [
                  search_widget('waitcare', hintnamefilter, ''
                      // Provider
                      //     .of<invoice_vm>(context, listen: true)
                      //     .listInvoicesAccept,
                      ),
                  SwitchListTile(
                    value: isMyClients,
                    onChanged: (value) {
                      setState(() => isMyClients = value);
                      getData();
                    },
                    title: Text("عملائي"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                          return GroupButton(
                              controller: GroupButtonController(
                                selectedIndex: selectedProvider.isbarsales,
                              ),
                              options: GroupButtonOptions(buttonWidth: 135, borderRadius: BorderRadius.circular(10)),
                              buttons: ['بالإنتظار', 'تم التقييم'],
                              onSelected: (_, index, isselected) {
                                switch (index) {
                                  case 0:
                                    type = 'wait';
                                    break;
                                  case 1:
                                    type = 'done';
                                    break;
                                }
                                selectedProvider.selectValuebarsales(index);
                                getData();
                              });
                        }),
                      ],
                    ),
                  ),
                  Provider.of<selected_button_provider>(context, listen: true).isbarsales == 1
                      ? Row(
                          children: [
                            Flexible(
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
                                          color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                      hintText: _selectedDatefrom == DateTime(1, 1, 1)
                                          ? 'from' //_currentDate.toString()
                                          : DateFormat('yyyy-MM-dd').format(_selectedDatefrom),
                                      //_invoice!.dateinstall_task.toString(),
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      _selectDatefrom(context, DateTime.now());
                                      // _selectDate(context, DateTime.now());
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Column(
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
                                          color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
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
                                      // if(_selectedDateto!=DateTime(1, 1, 1)
                                      //     &&_selectedDatefrom!=DateTime(1, 1, 1))
                                      //   getData();
                                      // _selectDate(context, DateTime.now());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Provider.of<selected_button_provider>(context, listen: true).isbarsales == 1
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                                return GroupButton(
                                    controller: GroupButtonController(
                                      selectedIndex: selectedProvider.isbarsalestype,
                                    ),
                                    options:
                                        GroupButtonOptions(buttonWidth: 40, borderRadius: BorderRadius.circular(10)),
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
                                      getData();
                                    });
                              }),
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عدد العملاء',
                          style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          listCommunication.length.toString(),
                          style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer2<communication_vm, ClientProvider>(
                        builder: (context, value, value2, child) {
                          final isLoadingClient = value2.isloading;
                          final isLoadingCommunication = value.isload;

                          return isLoadingClient || isLoadingCommunication
                              ? Center(child: CircularProgressIndicator())
                              : listCommunication.length == 0
                                  ? Center(child: Text(messageNoData))
                                  : Column(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: listCommunication.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                    padding: const EdgeInsets.all(2),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(bottomRight: Radius.circular(0)),
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                            offset: Offset(1.0, 1.0),
                                                            blurRadius: 8.0,
                                                            color: Colors.black87.withOpacity(0.2),
                                                          ),
                                                        ],
                                                        color: Colors.white30,
                                                      ),
                                                      child: Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                              CupertinoPageRoute(
                                                                builder: (context) => ProfileClient(
                                                                  idClient: listCommunication[index].fkClient,
                                                                  //     Provider.of<client_vm>(context, listen: true)
                                                                  // .currentClientModel.data!.idClients.toString(),
                                                                  // .listClient
                                                                  // .firstWhere((element) =>
                                                                  //     element.idClients ==
                                                                  //     listCommunication[index].fkClient)
                                                                  // .idClients,
                                                                  tabIndex: 4,
                                                                  tabCareIndex: 2,
                                                                  idCommunication:
                                                                      listCommunication[index].idCommunication,
                                                                ),
                                                              ),
                                                            );
                                                            // Navigator.push(
                                                            //     context,
                                                            //     CupertinoPageRoute(
                                                            //         builder: (context) => careRepeat(
                                                            //             type: type,
                                                            //             comobj: listCommunication[index],
                                                            //             // tabindex:2, //move to tab support in profile client
                                                            //             idclient:
                                                            //                 Provider.of<client_vm>(context, listen: true)
                                                            //                     .listClient
                                                            //                     .firstWhere((element) =>
                                                            //                         element.idClients ==
                                                            //                         listCommunication[index].fkClient))));
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                                            ),
                                                            //height: 70,//MediaQuery.of(context).size.height*0.15,
                                                            child: Padding(
                                                              padding: EdgeInsets.all(8),
                                                              child: Flex(
                                                                direction: Axis.vertical,
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            listCommunication[index]
                                                                                .name_regoin
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                                //fontWeight: FontWeight.bold,
                                                                                fontSize: 12,
                                                                                fontFamily: kfontfamily2,
                                                                                color: kMainColor),
                                                                          ),
                                                                          type == 'wait'
                                                                              ? Text(
                                                                                  int.parse(listCommunication[index]
                                                                                              .hoursdelaylabel
                                                                                              .toString()) <
                                                                                          0
                                                                                      ? ' تأخر عن التواصل  ' +
                                                                                          (int.parse(listCommunication[
                                                                                                          index]
                                                                                                      .hoursdelaylabel
                                                                                                      .toString()) *
                                                                                                  -1)
                                                                                              .toString() +
                                                                                          ' يوم '
                                                                                      : ' باقي ' +
                                                                                          listCommunication[index]
                                                                                              .hoursdelaylabel
                                                                                              .toString() +
                                                                                          ' يوم ',
                                                                                  style: TextStyle(
                                                                                      fontSize: 12,
                                                                                      //fontWeight: FontWeight.bold,
                                                                                      fontFamily: kfontfamily2,
                                                                                      color: kMainColor),
                                                                                )
                                                                              : Text(
                                                                                  listCommunication[index]
                                                                                      .rate
                                                                                      .toString(),
                                                                                  style: TextStyle(
                                                                                      //fontWeight: FontWeight.bold,
                                                                                      fontSize: 12,
                                                                                      fontFamily: kfontfamily2,
                                                                                      color: kMainColor),
                                                                                ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            listCommunication[index]
                                                                                .nameEnterprise
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 12,
                                                                              fontFamily: kfontfamily2,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      type == 'wait'
                                                                          ? Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Text(
                                                                                  'تاريخ التواصل القادم',
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 12,
                                                                                    fontFamily: kfontfamily2,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  listCommunication[index]
                                                                                      .dateNext
                                                                                      .toString(),
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 12,
                                                                                    fontFamily: kfontfamily2,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          : Container(),
                                                                      if ((listCommunication[index].tag ?? false) &&
                                                                          context
                                                                              .read<PrivilegeCubit>()
                                                                              .checkPrivilege('133'))
                                                                        Icon(
                                                                          CupertinoIcons.checkmark_seal_fill,
                                                                          color: Colors.amber,
                                                                        ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    // cardAccept(
                                                    //   itemClient: value.listClientAccept[index],
                                                    // ),
                                                    );
                                              }),
                                        ),
                                      ],
                                    );
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future<void> _selectDatefrom(BuildContext context, DateTime currentDate) async {
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

        //if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        getData();
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

        //if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        getData();
      });
  }
}
