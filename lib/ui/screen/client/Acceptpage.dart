import 'dart:ffi';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';

import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;
class invoicesAcceptclient extends StatefulWidget {
  invoicesAcceptclient({Key? key}) : super(key: key);

  @override
  _invoicesAcceptclientState createState() => _invoicesAcceptclientState();
}

class _invoicesAcceptclientState extends State<invoicesAcceptclient> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel itemClient;
  DateTime _selectedDatefrom = DateTime.now();
  DateTime _selectedDateto = DateTime.now();
  // late String typepayController;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      List<PrivilgeModel> list = await Provider.of<privilge_vm>(context, listen: false).privilgelist;
      Provider.of<invoice_vm>(context, listen: false).setvaluepriv(list);
      Provider.of<invoice_vm>(context, listen: false).getinvoice_Debt();
          // .getinvoice_Localwithprev();

      Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);
    Provider.of<invoice_vm>(context,listen: false).listInvoicesAccept=[];

     await Provider.of<client_vm>(context,listen: false)
           .getallclientAccept();

       Provider.of<client_vm>(context,listen: false)
          .getallclientAcceptwithprev();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ديون العملاء',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Consumer<privilge_vm>(
          builder: (context, privilge, child) {
            return SafeArea(
              child: Directionality(
                textDirection: myui.TextDirection.rtl,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            privilge.checkprivlge('94') == true ? //regoin
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8),
                                child: Consumer<regoin_vm>(
                                  builder: (context, cart, child) {
                                    return
                                      DropdownButton(
                                        isExpanded: true,
                                        hint: Text("الفرع"),
                                        items: cart.listregoinfilter.map((level_one) {
                                          return DropdownMenuItem(

                                            child: Text(level_one.name_regoin),
                                            //label of item
                                            value: level_one
                                                .id_regoin, //value of item
                                          );
                                        }).toList(),
                                        value: cart.selectedValueLevel,
                                        onChanged: (value) {
                                          //  setState(() {
                                          cart.changeVal(value.toString());
                                          regoin = value.toString();
                                          filtershow();
                                        },
                                      );
                                    //);
                                  },
                                ),
                              ),
                            ):Container(),///regoin
                            Expanded( //state
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 8),
                                child: Consumer<typeclient>(
                                    builder: (context, cart, child){
                                      return DropdownButton(
                                        isExpanded: true,
                                        hint: Text('الحالة'),
                                        //hint: Text("حدد حالة العميل"),
                                        items: cart.listtype_install.map((level_one) {
                                          return DropdownMenuItem(
                                            child: Text(level_one), //label of item
                                            value: level_one, //value of item
                                          );
                                        }).toList(),
                                        value:cart.selectedlisttype_install,
                                        onChanged:(value) {
                                          //namemanage=value.toString();
                                          cart.changelisttype_install(value.toString());
                                          typeclientvalue=value.toString();
                                          print('filter state'+value.toString());
                                          print(typeclientvalue);

                                          filtershow();
                                        },
                                      );}
                                ),
                              ),
                            ),   //الحالة
                          ],
                        ),


                        Row (
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
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
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
                                      // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                                      //   getData();
                                      // _selectDate(context, DateTime.now());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],),
                        search_widget(
                            'debt',
                            hintnamefilter,''
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('عدد الفواتير',style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                              Text(
                                Provider.of<invoice_vm>(context,listen: true)
                                    .listInvoicesAccept.length.toString(),style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                            ],),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.73,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<invoice_vm>(
                                builder: (context, value, child) {
                                  return value.isloading==true ?
                                  Center(
                                      child: CircularProgressIndicator()
                                  ):value.listInvoicesAccept.length == 0?
                                  Center(
                                      child: Text(messageNoData)
                                  ):Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: value.listInvoicesAccept.length,
                                            itemBuilder: (context, index) {
                                              // itemClient=Provider.of<client_vm>(context,listen: false)
                                              //     .listClient.firstWhere(
                                              //         (element) => element.idClients==value.listInvoicesAccept[index].fkIdClient);
                                              return SingleChildScrollView(
                                                child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        2),
                                                    child:
                                                    CardInvoiceClient(
                                                      type:'profile',
                                                      invoice: value.listInvoicesAccept[index],

                                                    )) ,
                                              );
                                            }),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            );
          }),
    );
  }

  void filtershow(){
    print(regoin);
    print(typeclientvalue);
    Provider.of<invoice_vm>(context,listen: false)
        .getfilterinvoicesclient(typeclientvalue,regoin,_selectedDatefrom,_selectedDateto);

    // }
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
        print(_selectedDatefrom.toString());
        if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
          Provider.of<invoice_vm>(context,listen: false)
              .getfilterinvoicesclient(typeclientvalue,regoin,_selectedDatefrom,_selectedDateto);

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
        print(_selectedDateto.toString());
        if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
          Provider.of<invoice_vm>(context,listen: false)
              .getfilterinvoicesclient(typeclientvalue,regoin,_selectedDatefrom,_selectedDateto);

      });
  }
}
