import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../ui/screen/client/addClient.dart';
import '../../../../ui/screen/client/filter_clients_sheet.dart';
import '../../../../ui/screen/client/profileclient.dart';
import '../../../../view_model/privilge_vm.dart';
import '../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_list_bloc.dart';

class ClientsListPage extends StatefulWidget {
  const ClientsListPage({Key? key}) : super(key: key);

  @override
  State<ClientsListPage> createState() => _ClientsListPageState();
}

class _ClientsListPageState extends State<ClientsListPage> {
  late ClientsListBloc _clientsListBloc;
  late final fkCountry;

  @override
  void initState() {
    fkCountry = context.read<ClientProvider>().usercurrent!.fkCountry.toString();
    _clientsListBloc = context.read<ClientsListBloc>()
      ..add(GetAllClientsListEvent(fkCountry: fkCountry!, perPage: 20, page: 1));
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      Provider.of<UserProvider>(context, listen: false).changevalueuser(null);
      Provider.of<ClientTypeProvider>(context, listen: false).changevaluefilter(null);
      // Provider.of<client_vm>(context, listen: false).clear();
      List<PrivilgeModel> list = Provider.of<PrivilegeProvider>(context, listen: false).privilegeList;
      Provider.of<ClientProvider>(context, listen: false).setvaluepriv(list);
      // Provider.of<client_vm>(context, listen: false).getclient_vm();
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
    });
    super.initState();
  }

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
    context.read<ClientProvider>().onSearchListClientFilter(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'قائمة العملاء',
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
              )
            : Container(),
        body: Consumer<PrivilegeProvider>(builder: (context, privilge, child) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 2),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 2),
                      // padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  )),
                              height: 60,
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
                          ),
                          Tooltip(
                            message: "فلترة",
                            child: InkWell(
                              onTap: () => AppBottomSheet.show(
                                context: context,
                                child: FilterClientsSheet(
                                  onChangeRegion: (value) {
                                    regoin = value.toString();
                                    filterShow();
                                  },
                                  onChangeClientType: (value) {
                                    typeclientvalue = value.toString();
                                    filterShow();
                                  },
                                  onResetEmployee: (context) {
                                    iduser = null;
                                    filterShow();
                                    Navigator.pop(context);
                                  },
                                  onChangeEmployee: (value) {
                                    iduser = value.idUser;
                                    filterShow();
                                  },
                                  onChangeActivity: (value) {
                                    activity = value?.id_activity_type.toString();
                                    filterShow();
                                  },
                                  onResetActivity: (context) {
                                    activity = null;
                                    filterShow();
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.grey.shade100.withAlpha(40),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.filter_alt_rounded, color: AppColors.grey.shade600, size: 30),
                              ),
                            ),
                          ),
                        ],
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
                          BlocBuilder<ClientsListBloc, ClientsListState>(
                            builder: (context, state) {
                              return state.clientsListState.when(
                                init: () => Center(child: Text("0")),
                                loading: () => Center(child: Text("0")),
                                loaded: (data) => Text(
                                  state.clientsListState.data.length.toString(),
                                  style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                                ),
                                empty: () => Center(child: Text("لايوجد عملاء")),
                                error: (exception) => Center(child: Text("Exception")),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 700,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: BlocBuilder<ClientsListBloc, ClientsListState>(
                          builder: (context, state) {
                            return state.clientsListState.when(
                              init: () => Center(child: CircularProgressIndicator()),
                              loading: () => Center(child: CircularProgressIndicator()),
                              loaded: (data) => RefreshIndicator(
                                onRefresh: () async {
                                  state.currentPage = 1;
                                  _clientsListBloc
                                      .add(GetAllClientsListEvent(fkCountry: fkCountry!, page: 1, perPage: 20));
                                },
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index == (state.clientsListState.data.length - 1)) {
                                      state.currentPage++;
                                      _clientsListBloc.add(GetAllClientsListEvent(
                                          fkCountry: fkCountry!, page: state.currentPage, perPage: 20));
                                    }
                                    return clientCardWidget(clientModel: state.clientsListState.data[index]);
                                  },
                                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
                                  itemCount: state.clientsListState.data.length,
                                ),
                              ),
                              empty: () => Center(child: Text("لايوجد عملاء")),
                              error: (exception) => Center(child: Text("sorry, something went wrong")),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Widget clientCardWidget({required ClientModel clientModel}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
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
            Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ProfileClient(idClient: clientModel.idClients.toString())
                    //   editclient(
                    // itemClient: itemClient,
                    // fkclient: itemClient.idClients.toString(),
                    // fkuser: itemClient.fkUser.toString(),)
                    ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,

              //borderRadius: BorderRadius.all( Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        clientModel.dateCreate.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
                      ),
                    ],
                  ),

                  // Row(
                  //   children: [
                  //     Container(
                  //
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(15)),
                  //         boxShadow: <BoxShadow>[
                  //           BoxShadow(
                  //             offset: Offset(1.0, 1.0),
                  //             blurRadius: 8.0,
                  //             color: Colors.black87.withOpacity(0.2),
                  //           ),
                  //         ],
                  //         color: kMainColor,
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 3,bottom: 3, left:6,right: 6),
                  //         child: Text(showtext(itemNotify.typeNotify),style:
                  //         TextStyle(
                  //           color: kWhiteColor,
                  //             //fontWeight: FontWeight.bold,
                  //             fontFamily: kfontfamily3),
                  //
                  //     ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Text(
                        clientModel.nameEnterprise.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                      ),
                    ),
                    if (clientModel.tag == "true" ? true : false)
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.amber,
                      )
                  ]),
                  //Row(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // return Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Row(
    //           children: [
    //             Text(
    //               "${communication.idClients}#",
    //               style: TextStyle(color: Colors.amber, fontFamily: kfontfamily2),
    //               textDirection: TextDirection.rtl,
    //               textAlign: TextAlign.start,
    //             ),
    //             SizedBox(width: 15),
    //             Expanded(
    //               child: TextScroll(
    //                 communication.nameClient ?? '',
    //                 mode: TextScrollMode.endless,
    //                 velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
    //                 delayBefore: Duration(milliseconds: 2000),
    //                 pauseBetween: Duration(milliseconds: 1000),
    //                 style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.w600),
    //                 textAlign: TextAlign.center,
    //                 textDirection: TextDirection.rtl,
    //               ),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 15),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Expanded(
    //               child: Row(
    //                 children: [
    //                   Text(
    //                     "اسم الشركة:",
    //                     style: TextStyle(fontFamily: kfontfamily2),
    //                     textDirection: TextDirection.rtl,
    //                     textAlign: TextAlign.start,
    //                   ),
    //                   Expanded(
    //                     child: TextScroll(
    //                       communication.nameEnterprise ?? "",
    //                       mode: TextScrollMode.endless,
    //                       velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
    //                       delayBefore: Duration(milliseconds: 2000),
    //                       pauseBetween: Duration(milliseconds: 1000),
    //                       style: TextStyle(fontFamily: kfontfamily2),
    //                       textAlign: TextAlign.center,
    //                       textDirection: TextDirection.rtl,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               decoration: BoxDecoration(
    //                 color: kMainColor,
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //               margin: EdgeInsetsDirectional.only(start: 10),
    //               child: Center(
    //                 child: Text(
    //                   "دوري",
    //                   style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 15),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               communication.name_regoin ?? '',
    //               style: TextStyle(color: Colors.grey.shade800, fontFamily: kfontfamily2),
    //               textDirection: TextDirection.rtl,
    //               textAlign: TextAlign.start,
    //             ),
    //             SizedBox(width: 15),
    //             Text(
    //               DateFormat("yyyy MMM dd hh:mm a", "ar").format(DateTime.now()),
    //               style: TextStyle(color: Colors.grey, fontFamily: kfontfamily2),
    //               textDirection: TextDirection.rtl,
    //               textAlign: TextAlign.start,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  void filterShow() {
    print("******* filter ******** ");
    context.read<ClientProvider>().filterClient(
          activity: activity,
          idUser: iduser,
          region: regoin,
          typeClient: typeclientvalue,
        );
  }
}
