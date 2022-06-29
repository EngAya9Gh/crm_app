


import 'dart:ffi';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
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
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
class ClientWaiting extends StatefulWidget {
  ClientWaiting({ required this.type_card, Key? key}) : super(key: key);
  String type_card;
  @override
  _ClientWaitingState createState() => _ClientWaitingState();
}

class _ClientWaitingState extends State<ClientWaiting> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel itemClient;
  late List<MainCityModel>? selecteditemmaincity=[];

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
      Provider.of<invoice_vm>(context,listen: false).listInvoicesAccept=[];
      // await Provider.of <maincity_vm>
      //   (context,listen: false)
      //     .getmaincity();
      // Provider.of<maincity_vm>
      //   (context,listen: false).changeitemlist(
      //     MainCityModel(fk_country: '',id_maincity: '0',namemaincity: 'الكل'));

      Provider.of<typeclient>
        (context,listen: false).changelisttype_install('الكل');
      typeclientvalue='الكل';
      //Provider.of<regoin_vm>(context,listen: false).changeVal(null);
      await Provider.of<client_vm>(context,listen: false)
          .getallclientAccept();

    //  await  Provider.of<invoice_vm>(context, listen: false)
    // .getClientWaiting();
      Provider.of<invoice_vm>(context,listen: false)
          .getfilter_maincity(selecteditemmaincity,typeclientvalue);

      //.getinvoice_Local("مشترك",'approved only',null);
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
                            // privilge.checkprivlge('1') == true ? //regoin
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8),
                                child:
                                // Consumer<maincity_vm>(
                                //   builder: (context, cart, child) {
                                //     return
                                //       DropdownButton(
                                //         isExpanded: true,
                                //         hint: Text("المناطق"),
                                //         items: cart.listmaincity.map((level_one) {
                                //           return DropdownMenuItem(
                                //             child: Text(level_one.namemaincity),
                                //             //label of item
                                //             value: level_one
                                //                 .id_maincity, //value of item
                                //           );
                                //         }).toList(),
                                //         value: cart.selectedValuemanag,
                                //         onChanged: (value) {
                                //           //  setState(() {
                                //           cart.changevalue(value.toString());
                                //           regoin = value.toString();
                                //           filtershow();
                                //         },
                                //       );
                                //     //);
                                //   },
                                // ),
                                Consumer<maincity_vm>(
                                  builder: (context, cart, child){
                                    return  DropdownSearch<MainCityModel>.multiSelection(
                                      mode: Mode.DIALOG,
                                      filterFn: (user, filter) => user!.getfilteruser(filter!),
                                      compareFn: (item, selectedItem) => item?.id_maincity == selectedItem?.id_maincity,
                                      // itemAsString: (UserModel u) => u.userAsStringByName(),
                                      items: cart.listmaincityfilter,
                                      showSelectedItems: true,
                                      selectedItems: cart.selecteditemmaincity,
                                      itemAsString: (u) => u!.userAsString(),
                                      onChanged: (data) {
                                        for(int i=0;i<data.length;i++)
                                         print(data[i].id_maincity);
                                        print(data);
                                        selecteditemmaincity=data;
                                        cart.changeitemlist(data);
                                        filtershow();
                                      } ,
                                      //selectedItem: cart.selecteduser,
                                      showSearchBox: true,
                                      dropdownSearchDecoration:
                                      InputDecoration(
                                        //filled: true,
                                        isCollapsed: true,
                                        hintText: 'المنطقة',
                                        alignLabelWithHint: true,
                                        fillColor:  Colors.grey.withOpacity(0.2),
                                        //labelText: "choose a user",
                                        contentPadding: EdgeInsets.all(0),
                                        //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        // focusedBorder: OutlineInputBorder(
                                        //     borderRadius: BorderRadius.circular(10),
                                        //     borderSide: const BorderSide(color: Colors.white)),
                                        border:
                                        UnderlineInputBorder(
                                            borderSide: const BorderSide(  color: Colors.grey)
                                        ),
                                        // OutlineInputBorder(
                                        //     borderRadius: BorderRadius.circular(10),
                                        //     borderSide: const BorderSide( color: Colors.white)),
                                      ),
                                      // InputDecoration(border: InputBorder.none),

                                    );

                                  },
                                ),
                              ),
                            ),///regoin
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
                            'waitsupport',
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
                                                    widget.type_card=='support'?cardWaiting(
                                                      iteminvoice:
                                                      value.listInvoicesAccept[index],
                                                    ):   CardInvoiceClient(
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
    .getfilter_maincity(selecteditemmaincity,typeclientvalue);

         //.getclienttype_filter(typeclientvalue,regoin,'only');

    // }
  }
}
