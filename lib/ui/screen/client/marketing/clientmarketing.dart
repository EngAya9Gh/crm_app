import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardAllclient.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../addClient.dart';

class clientmarketing extends StatefulWidget {
  clientmarketing({Key? key}) : super(key: key);

  @override
  _clientmarketingState createState() => _clientmarketingState();
}

class _clientmarketingState extends State<clientmarketing> {
  // final controllerUsers = Get.find<AllUserVMController>();
  List<ClientModel> _list = [];
  String? iduser;
  String? regoin;
  String? activity = '';

  String? typeclientvalue;
  UserModel? user;
  bool _isLoading = false;
  int isSelectedtypeinstall = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<user_vm_provider>(context, listen: false).getuser_vm();
      print(Provider.of<user_vm_provider>(context, listen: false).userall.length);
      Provider.of<regoin_vm>(context, listen: false).changeVal(null);
      Provider.of<user_vm_provider>(context, listen: false).changevalueuser(null);
      Provider.of<typeclient>(context, listen: false).changevaluefilter(null);
      // Add Your Code here.
      // Provider.of<regoin_vm>(context,listen: false).getregoin();

      List<PrivilgeModel> list = await Provider.of<privilge_vm>(context, listen: false).privilgelist;
      Provider.of<client_vm>(context, listen: false).setvaluepriv(list);
      await Provider.of<client_vm>(context, listen: false).getclientMarketing();
      await Provider.of<activity_vm>(context, listen: false).getactv();
    });

    //  WidgetsBinding.instance.addPostFrameCallback((_) {
  }

  @override
  void didChangeDependencies() {
    // List<ClientModel> list= Provider.of<client_vm>(context, listen: false)
    // .listClientbyRegoin;
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //
    // }
    // );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Provider.of<typeclient>(context,listen: false).changevalue(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  Provider.of<client_vm>(context, listen: false).getudate();

    print('build tabview');
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'قائمة عملاء التسويق الإلكتروني ',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
        ),
        floatingActionButton: Provider.of<privilge_vm>(context, listen: true).checkprivlge('47') == true
            ? FloatingActionButton(
                backgroundColor: kMainColor,
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => addClient()));
                },
                tooltip: 'إضافة عميل',
                child: Icon(Icons.add),
                heroTag: 'add clients',
              )
            : Container(),
        body: Consumer<privilge_vm>(builder: (context, privilge, child) {
          return RefreshIndicator(
            onRefresh: () async {
              ///setstat
              // Provider.of<regoin_vm>(context,listen: false).changeVal(null);
              // Provider.of<typeclient>(context,listen: false).changevaluefilter(null);
              // Provider.of<user_vm_provider>(context,listen: false).changevalueuser(null);
              // await    Provider.of<client_vm>(context, listen: false)
              //     .getclientMarketing(
              //   // Provider.of<privilge_vm>(context,listen: false)
              //   //     .privilgelist
              // );
              // setState(() {
              //   Provider.of<user_vm_provider>(context,listen: false).changevalueuser();
              // });
            },
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 2),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          privilge.checkprivlge('8') == true
                              ? //regoin
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                    child: Consumer<regoin_vm>(
                                      builder: (context, cart, child) {
                                        return
                                            //   Container(
                                            //   height: 57,
                                            //   decoration: BoxDecoration(
                                            //
                                            //        border:Border.all(
                                            //
                                            //          color: Colors.grey.withOpacity(0.9)
                                            //          //width: 1,
                                            //        ),
                                            //     borderRadius: BorderRadius.all(
                                            //       Radius.circular(6.0) //                 <--- border radius here
                                            // ),
                                            //   ),
                                            //   child:
                                            //   Container(
                                            //     height: 57,
                                            //     child:
                                            //     DropdownButtonFormField(
                                            //
                                            //       decoration:InputDecoration(
                                            //           enabledBorder: OutlineInputBorder(
                                            //               borderRadius: BorderRadius.circular(10),
                                            //               borderSide: BorderSide(
                                            //                   width: 1,
                                            //                   color: Colors.grey)
                                            //           )
                                            //       ) ,
                                            DropdownButton(
                                          isExpanded: true,
                                          hint: Text("الفرع"),
                                          items: cart.listregoinfilter.map((level_one) {
                                            return DropdownMenuItem(
                                              child: Text(level_one.name_regoin), //label of item
                                              value: level_one.id_regoin, //value of item
                                            );
                                          }).toList(),
                                          value: cart.selectedValueLevel,
                                          onChanged: (value) {
                                            //  setState(() {
                                            cart.changeVal(value.toString());
                                            regoin = value.toString();
                                            filtershow();
                                            // Provider.of<client_vm>(context, listen: false)
                                            //     .getclientfilter_Local(value.toString(),"regoin",
                                            //     Provider.of<typeclient>(context,listen: false).selectedValuemanag);
                                            // // });
                                          },
                                        );
                                        //);
                                      },
                                    ),
                                  ),
                                )
                              : Container(),
                          // (   privilge.checkprivlge('16')==true
                          //     && privilge.checkprivlge('8')!=true
                          //     && privilge.checkprivlge('15')!=true )?
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 8),
                              child: Consumer<typeclient>(builder: (context, cart, child) {
                                return DropdownButton(
                                  isExpanded: true,
                                  hint: Text('الحالة'),
                                  //hint: Text("حدد حالة العميل"),
                                  items: cart.type_of_client_filter.map((level_one) {
                                    return DropdownMenuItem(
                                      child: Text(level_one), //label of item
                                      value: level_one, //value of item
                                    );
                                  }).toList(),
                                  value: cart.selectedValufilter,
                                  onChanged: (value) {
                                    //namemanage=value.toString();
                                    cart.changevaluefilter(value.toString());
                                    typeclientvalue = value.toString();
                                    print(typeclientvalue);
                                    filtershow();
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),

                      //SizedBox(height: 2,),
                      privilge.checkprivlge('15') == true || privilge.checkprivlge('8') == true
                          ? //user
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8,
                              ),
                              child: Consumer<user_vm_provider>(
                                builder: (context, cart, child) {
                                  return DropdownSearch<UserModel>(
                                    mode: Mode.DIALOG,
                                    filterFn: (user, filter) => user!.getfilteruser(filter!),
                                    items: cart.usersMarketingManagement,
                                    itemAsString: (u) => u!.userAsString(),
                                    onChanged: (data) {
                                      iduser = data!.idUser;
                                      cart.changevalueuser(data);
                                      filtershow();
                                    },
                                    selectedItem: cart.selecteduser,
                                    showSearchBox: true,
                                    dropdownSearchDecoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'الموظف',
                                      alignLabelWithHint: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      contentPadding: EdgeInsets.all(0),
                                      border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 2,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8,
                        ),
                        child: Consumer<activity_vm>(
                          builder: (context, cart, child) {
                            return DropdownButton(
                              isExpanded: true,
                              hint: Text("النشاط"),
                              items: cart.list_activity.map((level_one) {
                                return DropdownMenuItem(
                                  child: Text(level_one.name_activity_type), //label of item
                                  value: level_one.id_activity_type, //value of item
                                );
                              }).toList(),
                              value: cart.selectedValueOut,
                              onChanged: (value) {
                                //  setState(() {
                                cart.changevalueOut(value.toString());
                                activity = value.toString();
                                filtershow();
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),

                      search_widget('clientmarketing', hintnamefilter, ''),
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
                              Provider.of<client_vm>(context, listen: true).listClientMarketing.length.toString(),
                              style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 8.0, bottom: 20),
                          child: Consumer<client_vm>(builder: (context, value, child) {
                            return value.isloading_marketing
                                ? Center(child: CircularProgressIndicator())
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: value.listClientMarketing.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: cardAllClient(
                                                    clientModel: value.listClientMarketing[index],
                                                  )
                                                  //cardClientAccept(iteminvoice: null,)
                                                  // cardClientnew(
                                                  //     itemClient: value.listClientfilter[index],
                                                  //     iduser: iduser.toString()),
                                                  );
                                            }),
                                      ),
                                    ],
                                  );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        })

        //    )
        );
  }

  void filtershow() {
    print("******* filter ******** ");
    context.read<client_vm>().filterClientMarketingSalesList(
          activity: activity,
          idUser: iduser,
          region: regoin,
          typeClient: typeclientvalue,
        );

    // print(typeclientvalue);
    // if(typeclientvalue=='الكل'){
    //   Provider.of<client_vm>(context, listen: false) .resetlist();
    // }
    // else{
    //   if( Provider.of<regoin_vm>(context,listen: false).selectedValueLevel!=null&&
    //       iduser!=null){
    //     Provider.of<client_vm>(context, listen: false)
    //         .getclientfilter_Local(iduser ,"3", typeclientvalue, regoin,activity);
    //   }else{
    //     if(Provider.of<regoin_vm>(context,listen: false).selectedValueLevel==null&&
    //         iduser==null){
    //       Provider.of<client_vm>(context, listen: false)
    //           .getclientfilter_Local(typeclientvalue,"type",null,null,activity );
    //     }
    //     else{
    //       if(iduser==null) {
    //         Provider.of<client_vm>(context, listen: false)
    //             .getclientfilter_Local(
    //             regoin, "regoin",
    //             typeclientvalue,null,activity);
    //       }else{
    //
    //         Provider.of<client_vm>(context, listen: false)
    //             .getclientfilter_Local(iduser,"user",typeclientvalue,null,activity);
    //       }
    //     }}
    // }
  }
}
