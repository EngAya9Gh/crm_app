import 'package:crm_smart/model/ActivityModel.dart';
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
import '../../../constants.dart';
import 'addClient.dart';

class tabclients extends StatefulWidget {
  tabclients({Key? key}) : super(key: key);

  @override
  _tabclientsState createState() => _tabclientsState();
}

class _tabclientsState extends State<tabclients> {
  List<ClientModel> _list = [];
  String? iduser;
  String? regoin;
  String? activity = '';
  String? typeclientvalue;
  UserModel? user;
  bool _isLoading = false;
  int isSelectedtypeinstall = 0;
  late TextEditingController _searchTextField;

  @override
  void initState() {
    super.initState();
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<regoin_vm>(context, listen: false).changeVal(null);
      Provider.of<user_vm_provider>(context, listen: false).changevalueuser(null);
      Provider.of<typeclient>(context, listen: false).changevaluefilter(null);
      Provider.of<client_vm>(context, listen: false).clear();
      List<PrivilgeModel> list = Provider.of<privilge_vm>(context, listen: false).privilgelist;
      Provider.of<client_vm>(context, listen: false).setvaluepriv(list);
      Provider.of<client_vm>(context, listen: false).getclient_vm(false);
      context.read<activity_vm>()
        ..initValueOut()
        ..getactv();
    });
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    context.read<client_vm>().onSearchListClientFilter(_searchTextField.text);
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
            'قائمة العملاء ',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
        ),

        // Provider.of<privilge_vm>(context,listen: true)
        //     .checkprivlge('47')==true ?
        floatingActionButton: Provider.of<privilge_vm>(context, listen: true).checkprivlge('47') == true
            ? FloatingActionButton(
                backgroundColor: kMainColor,
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => addClient()));
                },
                tooltip: 'إضافة عميل',
                child: Icon(Icons.add),
              )
            : Container(),
        body: Consumer<privilge_vm>(builder: (context, privilge, child) {
          return SafeArea(
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
                                      return DropdownButton(
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
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 8),
                            child: Consumer<typeclient>(builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text('الحالة'),
                                items: cart.type_of_client_filter.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one), //label of item
                                    value: level_one, //value of item
                                  );
                                }).toList(),
                                value: cart.selectedValufilter,
                                onChanged: (value) {
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
                                return Row(
                                  children: [
                                    if (cart.selecteduser != null) ...{
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
                                        items: cart.usersSalesManagement,
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
                                          border:
                                              UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                                        ),
                                        // InputDecoration(border: InputBorder.none),
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
                      child: Consumer<activity_vm>(
                        builder: (context, cart, child) {
                          return Row(
                            children: [
                              if (cart.selectedValueOut != null) ...{
                                IconButton(
                                    onPressed: () {
                                      cart.changevalueOut(null);
                                      activity = null;
                                      filtershow();
                                    },
                                    icon: Icon(Icons.highlight_off)),
                                SizedBox(width: 10),
                              },
                              Expanded(
                                child: DropdownButton(
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
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          )),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _searchTextField,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: hintnamefilter,
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                          Consumer<client_vm>(builder: (context, value, child) {
                            final list =
                                _searchTextField.text.isEmpty ? value.listClientfilter : value.listClientFilterSearch;

                            return Text(
                              list.length.toString(),
                              style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                            );
                          })
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.73,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8.0, bottom: 40),
                        child: Consumer<client_vm>(builder: (context, value, child) {
                          final list =
                              _searchTextField.text.isEmpty ? value.listClientfilter : value.listClientFilterSearch;

                          return value.isloading == true
                              ? Center(child: CircularProgressIndicator())
                              : list.length == 0
                                  ? Center(child: Text(messageNoData))
                                  : Column(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: list.length,
                                              // padding: const EdgeInsets.all(2),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: cardAllClient(
                                                    clientModel: list[index],
                                                  ),
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
          );
        })

        //    )
        );
  }

  void filtershow() {
    print("******* filter ******** ");
    context.read<client_vm>().filterClient(
          activity: activity,
          idUser: iduser,
          region: regoin,
          typeClient: typeclientvalue,
        );

    /// old way to filter clients list
    // if(typeclientvalue=='الكل'){
    //   Provider.of<client_vm>(context, listen: false) .resetlist();
    // }
    // else{
    // if( Provider.of<regoin_vm>(context,listen: false).selectedValueLevel!=null&&
    //     iduser!=null) {
    //   Provider.of<client_vm>(context, listen: false)
    //       .getclientfilter_Local(iduser ,"3", typeclientvalue, regoin,activity);
    // } else {
    //   if(Provider.of<regoin_vm>(context,listen: false).selectedValueLevel==null&&
    //       iduser==null){
    //     Provider.of<client_vm>(context, listen: false)
    //         .getclientfilter_Local(typeclientvalue,"type",null,null,activity);
    //   }
    //   else{
    //     if(iduser==null) {
    //       Provider.of<client_vm>(context, listen: false)
    //           .getclientfilter_Local(
    //            regoin, "regoin",
    //           typeclientvalue,null,activity);
    //     }else{
    //
    //       Provider.of<client_vm>(context, listen: false)
    //           .getclientfilter_Local(iduser,"user",typeclientvalue,null,activity);
    //     }
    //   }}
    // }
  }
}
