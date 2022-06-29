


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
class OutClient extends StatefulWidget {
  OutClient({ Key? key }) : super(key: key);

  @override
  _OutClientState createState() => _OutClientState();
}

class _OutClientState extends State<OutClient> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel itemClient;
  // late String typepayController;
  @override void didChangeDependencies() async {

    super.didChangeDependencies();
  }
  @override void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
      // Add Your Code here.
      // only
      //if(widget.type=='only')
      //  Provider.of<invoice_vm>(context, listen: false).getinvoice_Local("مشترك",'approved only');
      //if(widget.type=='client')
      Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);

      Provider.of<invoice_vm>(context, listen: false)
          .getinvoice_Local("منسحب",'out',null);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفواتير المنسحبة ',style: TextStyle(color: kWhiteColor),),
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
                            ),// : Container(),

                          ],
                        ),
                        search_widget(
                          'waitout',
                          hintnamefilter,''
                          // Provider
                          //     .of<invoice_vm>(context, listen: true)
                          //     .listInvoicesAccept,
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
                                  return
                                    value.isloading==true?
                                    CircularProgressIndicator():
                                    value.listInvoicesAccept.length == 0 ?
                                  Center(
                                      child: Text(messageNoData),
                                  )
                                          :Column(
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
                    )),
              ),
            );
          }),
    );
  }

  void filtershow(){
    print(regoin);
    print(typeclientvalue);
    //    Provider.of<invoice_vm>(context,listen: false)
    //       .getfilterinvoice(regoin);
    // Provider.of<client_vm>(context,listen: false)
    //     .getfilterview(regoin);
    //  String filter='';
    //  switch(typeclientvalue){
    //    case '0':
    //      filter='الكل';
    //      break;
    //    case '1':
    //      filter='بالإنتظار';
    //      break;
    //    case '2':
    //      filter='تم التركيب';
    //      break;
    //  }
    Provider.of<invoice_vm>(context,listen: false)
        .getclienttype_filter('مستبعد',regoin,'out');

    // }
  }
}
