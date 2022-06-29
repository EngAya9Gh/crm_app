

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
class Care_ClientAccept extends StatefulWidget {
  Care_ClientAccept({Key? key}) : super(key: key);

  @override
  _ClientAcceptState createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<Care_ClientAccept> {
  String? regoin;
  String? typeclientvalue;
  // late String typepayController;
  @override void didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      Provider.of<client_vm>(context, listen: false).clear();
    });
    super.didChangeDependencies();
  }
  @override void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
      // Add Your Code here.
      // only
      await Provider.of<privilge_vm>(context,listen: false)
          .getprivlg_usercurrent();
      List<PrivilgeModel> list=
          Provider.of<privilge_vm>(context,listen: false).privilgelist;
      Provider.of<client_vm>(context, listen: false).setvaluepriv(list);
      //Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);
      Provider.of<client_vm>(context, listen: false).listClientAccept=[];
      // Provider.of<client_vm>(context, listen: false)
      //   .getallclient();
      Provider.of<client_vm>(context, listen: false)
          . getclient_Local('مشترك');

      // Provider.of<maincity_vm>
      //   (context,listen: false).changevalue(null);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العملاء المشتركين',style: TextStyle(color: kWhiteColor),),
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
                            // privilge.checkprivlge('1') == true ? //regoin
                            // Expanded(
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(left: 8.0, right: 8),
                            //     child: Consumer<regoin_vm>(
                            //       builder: (context, cart, child) {
                            //         return
                            //           DropdownButton(
                            //             isExpanded: true,
                            //             hint: Text("الفرع"),
                            //             items: cart.listregoinfilter.map((level_one) {
                            //               return DropdownMenuItem(
                            //
                            //                 child: Text(level_one.name_regoin),
                            //                 //label of item
                            //                 value: level_one
                            //                     .id_regoin, //value of item
                            //               );
                            //             }).toList(),
                            //             value: cart.selectedValueLevel,
                            //             onChanged: (value) {
                            //               //  setState(() {
                            //               cart.changeVal(value.toString());
                            //               regoin = value.toString();
                            //               filtershow();
                            //             },
                            //           );
                            //         //);
                            //       },
                            //     ),
                            //   ),
                            // ),
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
                                          print('regoin'+regoin.toString());
                                          filtershow();
                                        },
                                      );
                                    //);
                                  },
                                ),
                              ),
                            ),
                            // Consumer<typeclient>(
                            //     builder: (context, selectedProvider, child){
                            //       return  GroupButton(
                            //           controller: GroupButtonController(
                            //             selectedIndex:selectedProvider.selectedinstall,
                            //
                            //           ),
                            //           options: GroupButtonOptions(
                            //               selectedColor: kMainColor,
                            //
                            //               buttonWidth: 110,
                            //               borderRadius: BorderRadius.circular(10)),
                            //           buttons: ['الكل','بالإنتظار','تم التركيب'],
                            //           onSelected: (index,isselected){
                            //             print(index);
                            //             //setState(() {
                            //             typepayController=index.toString();
                            //             selectedProvider.changeinstall(index);
                            //             filtershow();
                            //             //});
                            //           }
                            //       );
                            //     }
                            //
                            // ),

                          ],
                        ),
                        search_widget(
                            'accept',
                            hintnamefilter,''
                          // Provider
                          //     .of<invoice_vm>(context, listen: true)
                          //     .listInvoicesAccept,
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('عدد العملاء',style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                              Text(
                                Provider.of<client_vm>(context,listen: true).listClientAccept.length.toString(),style: TextStyle(
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
                            child: Consumer<client_vm>(
                                builder: (context, value, child) {
                                  return value.isloading==true?
                                  Center(
                                      child: CircularProgressIndicator()
                                  ) :
                                  value.listClientAccept.length == 0 ?
                                  Center(
                                      child: Text(messageNoData)
                                  )  : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: value.listClientAccept.length,
                                            itemBuilder: (context, index) {
                                              return SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        2),
                                                    child:
                                                    cardAccept(
                                                      itemClient: value.listClientAccept[index],
                                                    ),
                                                  )
                                              );
                                            }),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }),
    );
  }

  void filtershow(){
    print(regoin);
    // print(typeclientvalue);
      Provider.of<invoice_vm>(context,listen: false)
          .getclienttype_filter(typeclientvalue!,regoin,'only');
    // Provider.of<client_vm>(context,listen: false)
    //     .getfilterviewSupport(regoin);
    //   if(regoin==null)
    //  Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    // else {
    //
    //   Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    //
    // }
  }
}
