

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
class support_view extends StatefulWidget {
   support_view({required this.type,Key? key}) : super(key: key);
   String type;
  @override
  _support_viewState createState() => _support_viewState();
}

class _support_viewState extends State<support_view> {
  String? regoin;
  String? typeclientvalue;
  // late String typepayController;
  @override void didChangeDependencies() async {

    super.didChangeDependencies();
  }
@override void initState() {

  WidgetsBinding.instance!.addPostFrameCallback((_)async{
    // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
    // Add Your Code here.
    // only
    if(widget.type=='only')
      Provider.of<invoice_vm>(context, listen: false)
          .getinvoice_Local("مشترك",'approved only',null);
    if(widget.type=='client')
      Provider.of<invoice_vm>(context, listen: false)
          .getinvoice_Local("مشترك",'approved client',null);
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
                        ) : Container(),
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
                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 20.0,right: 8),
                        //     child: Consumer<typeclient>(
                        //         builder: (context, cart, child){
                        //           return DropdownButton(
                        //             isExpanded: true,
                        //             hint: Text('الحالة'),
                        //             //hint: Text("حدد حالة العميل"),
                        //             items: cart.listtype_install.map((level_one) {
                        //               return DropdownMenuItem(
                        //                 child: Text(level_one), //label of item
                        //                 value: level_one, //value of item
                        //               );
                        //             }).toList(),
                        //             value:cart.selectedlisttype_install,
                        //             onChanged:(value) {
                        //               //namemanage=value.toString();
                        //               cart.changelisttype_install(value.toString());
                        //               typeclientvalue=value.toString();
                        //               filtershow();
                        //             },
                        //           );}
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                      search_widget(
                        'invoice',
                        hintnamefilter,''

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
                                return value.listInvoicesAccept.length == 0 ?
                                Center(child: Text('لا توجد بيانات'))
                                    : Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: value.listInvoicesAccept.length,
                                          itemBuilder: (context, index) {
                                            return SingleChildScrollView(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      2),
                                                  child:
                                                  cardClientAccept(
                                                        iteminvoice: value.listInvoicesAccept[index],
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
    //   Provider.of<invoice_vm>(context,listen: false)
    //       .getclienttype_filter(typeclientvalue!,regoin,'only');
    Provider.of<invoice_vm>(context,listen: false)
        .getfilterview(regoin,'only');
    //   if(regoin==null)
    //  Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    // else {
    //
    //   Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    //
    // }
    }
}
