


import 'dart:ffi';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardwaiting.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
class invoicesAcceptclient extends StatefulWidget {
  invoicesAcceptclient({ Key? key}) : super(key: key);

  @override
  _invoicesAcceptclientState createState() => _invoicesAcceptclientState();
}

class _invoicesAcceptclientState extends State<invoicesAcceptclient> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel itemClient;
  // late String typepayController;
  @override void didChangeDependencies() async {

    super.didChangeDependencies();
  }
  @override void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      List<PrivilgeModel> list=
      await   Provider.of<privilge_vm>(context,listen: false).privilgelist;
      Provider.of<invoice_vm>(context, listen: false).setvaluepriv(list);
      Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);
    Provider.of<invoice_vm>(context,listen: false).listInvoicesAccept=[];
     await Provider.of<client_vm>(context,listen: false)
           .getallclientAccept();
       Provider.of<client_vm>(context,listen: false)
          .getallclientAcceptwithprev();
      Provider.of<invoice_vm>(context, listen: false)
          .getinvoice_Localwithprev();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فواتير العملاء',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: Consumer<privilge_vm>(
          builder: (context, privilge, child) {
            return SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            privilge.checkprivlge('1') == true ? //regoin
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

                        search_widget(
                            'waitwithprev',
                            hintnamefilter,''
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('عدد العملاء',style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                              Text(
                                Provider.of<invoice_vm>(context,listen: true).listInvoicesAccept.length.toString(),style: TextStyle(
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
                                                      itemProd: value.listInvoicesAccept[index],
                                                      //itemClient :  itemClient,

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
        .getfilterinvoicesclient(typeclientvalue,regoin);

    // }
  }
}
