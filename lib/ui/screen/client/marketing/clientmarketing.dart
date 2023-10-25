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
import '../../../../model/ActivityModel.dart';
import '../addClient.dart';

class clientmarketing extends StatefulWidget {
  clientmarketing({Key? key}) : super(key: key);

  @override
  _clientmarketingState createState() => _clientmarketingState();
}

class _clientmarketingState extends State<clientmarketing> {
  String? iduser;
  String? regoin;
  String? activity = '';
  String? typeclientvalue;
  UserModel? user;
  int isSelectedtypeinstall = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UserProvider>(context, listen: false).getUsersVm();
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      Provider.of<UserProvider>(context, listen: false).changevalueuser(null);
      Provider.of<ClientType>(context, listen: false).changevaluefilter(null);
      List<PrivilgeModel> list = Provider.of<PrivilegeProvider>(context, listen: false).privilegeList;
      Provider.of<ClientProvider>(context, listen: false).setvaluepriv(list);
      await Provider.of<ClientProvider>(context, listen: false).getclientMarketing();
      await Provider.of<ActivityVm>(context, listen: false).getActivities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'قائمة عملاء التسويق الإلكتروني ',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
        ),
        floatingActionButton: Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('47') == true
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
        body: Consumer<PrivilegeProvider>(builder: (context, privilge, child) {
          return RefreshIndicator(
            onRefresh: () async {},
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
                          privilge.checkPrivilege('8') == true
                              ? //regoin
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                    child: Consumer<RegionProvider>(
                                      builder: (context, cart, child) {
                                        return DropdownButton(
                                          isExpanded: true,
                                          hint: Text("الفرع"),
                                          items: cart.listRegionFilter.map((level_one) {
                                            return DropdownMenuItem(
                                              child: Text(level_one.regionName), //label of item
                                              value: level_one.regionId, //value of item
                                            );
                                          }).toList(),
                                          value: cart.selectedRegionId,
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
                                )
                              : Container(),
                          // (   privilge.checkprivlge('16')==true
                          //     && privilge.checkprivlge('8')!=true
                          //     && privilge.checkprivlge('15')!=true )?
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 8),
                              child: Consumer<ClientType>(builder: (context, cart, child) {
                                return DropdownButton(
                                  isExpanded: true,
                                  hint: Text('الحالة'),
                                  items: cart.typeOfClientFilter.map((level_one) {
                                    return DropdownMenuItem(
                                      child: Text(level_one), //label of item
                                      value: level_one, //value of item
                                    );
                                  }).toList(),
                                  value: cart.selectedValufilter,
                                  onChanged: (value) {
                                    cart.changevaluefilter(value.toString());
                                    typeclientvalue = value.toString();
                                    filtershow();
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),

                      //SizedBox(height: 2,),
                      privilge.checkPrivilege('15') == true || privilge.checkPrivilege('8') == true
                          ? //user
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8,
                              ),
                              child: Consumer<UserProvider>(
                                builder: (context, cart, child) {
                                  return Row(
                                    children: [
                                      if (cart.selectedUser != null) ...{
                                        IconButton(
                                            onPressed: () {
                                              iduser = null;
                                              cart.changevalueuser(null);
                                              filtershow();
                                            },
                                            icon: Icon(Icons.highlight_off)),
                                        SizedBox(width: 10),
                                      },
                                      Expanded(
                                        child: DropdownSearch<UserModel>(
                                          mode: Mode.DIALOG,
                                          filterFn: (user, filter) => user!.getfilteruser(filter!),
                                          compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
                                          items: cart.usersMarketingManagement,
                                          itemAsString: (u) => u!.userAsString(),
                                          onChanged: (data) {
                                            iduser = data!.idUser;
                                            cart.changevalueuser(data);
                                            filtershow();
                                          },
                                          selectedItem: cart.selectedUser,
                                          showSearchBox: true,
                                          dropdownSearchDecoration: InputDecoration(
                                            isCollapsed: true,
                                            hintText: 'الموظف',
                                            alignLabelWithHint: true,
                                            fillColor: Colors.grey.withOpacity(0.2),
                                            contentPadding: EdgeInsets.all(0),
                                            border:
                                                UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                                          ),
                                        ),
                                      ),
                                    ],
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
                        child: Consumer<ActivityVm>(
                          builder: (context, cart, child) {
                            return Row(
                              children: [
                                if (cart.selectedActivity != null) ...{
                                  IconButton(
                                      onPressed: () {
                                        activity = '';
                                        cart.onChangeSelectedActivity(null);
                                        filtershow();
                                      },
                                      icon: Icon(Icons.highlight_off)),
                                  SizedBox(width: 10),
                                },
                                Expanded(
                                  child:   DropdownSearch<ActivityModel>(
                                    mode: Mode.DIALOG,
                                    filterFn: (user, filter) => user!.getfilter_actv(filter!),
                                    compareFn: (item, selectedItem) => item?.id_activity_type == selectedItem?.id_activity_type,
                                    items: cart.activitiesList,
                                    itemAsString: (u) => u!.userAsString(),
                                    onChanged: (data) {
                                      // iduser = data!.id_activity_type;
                                      cart.onChangeSelectedActivity(data);
                                      activity = data?.id_activity_type.toString();
                                      filtershow();
                                    },
                                    selectedItem: cart.selectedActivity,
                                    showSearchBox: true,
                                    dropdownSearchDecoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'النشاط',
                                      alignLabelWithHint: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      contentPadding: EdgeInsets.all(0),
                                      border:
                                      UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                                    ),
                                    // InputDecoration(border: InputBorder.none),
                                  ),
                                  // DropdownButton(
                                  //   isExpanded: true,
                                  //   hint: Text("النشاط"),
                                  //   items: cart.list_activity.map((level_one) {
                                  //     return DropdownMenuItem(
                                  //       child: Text(level_one.name_activity_type), //label of item
                                  //       value: level_one.id_activity_type, //value of item
                                  //     );
                                  //   }).toList(),
                                  //   value: cart.selectedValueOut,
                                  //   onChanged: (value) {
                                  //     cart.changevalueOut(value.toString());
                                  //     activity = value.toString();
                                  //     filtershow();
                                  //   },
                                  // ),
                                ),
                              ],
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
                              Provider.of<ClientProvider>(context, listen: true).listClientMarketing.length.toString(),
                              style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 8.0, bottom: 20),
                          child: Consumer<ClientProvider>(builder: (context, value, child) {
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
                                                  child: CardAllClient(
                                                    clientModel: value.listClientMarketing[index],
                                                  ));
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
    context.read<ClientProvider>().filterClientMarketingSalesList(
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
