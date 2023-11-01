import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardAllclient.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../features/app/presentation/widgets/app_bottom_sheet.dart';
import 'addClient.dart';
import '../../../features/clients_list/presentation/pages/filter_clients_sheet.dart';

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
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      Provider.of<UserProvider>(context, listen: false).changevalueuser(null);
      Provider.of<ClientTypeProvider>(context, listen: false).changevaluefilter(null);
      Provider.of<ClientProvider>(context, listen: false).clear();
      List<PrivilgeModel> list = Provider.of<PrivilegeProvider>(context, listen: false).privilegeList;
      Provider.of<ClientProvider>(context, listen: false).setvaluepriv(list);
      Provider.of<ClientProvider>(context, listen: false).getclient_vm();
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
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
    context.read<ClientProvider>().onSearchListClientFilter(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'قائمة العملاء ',
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
      body: Consumer<ClientProvider>(
        builder: (context, clientVm, child) {
          if (clientVm.isloading == true) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          final clients = _searchTextField.text.isEmpty ? clientVm.listClientfilter : clientVm.listClientFilterSearch;

          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  15.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
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
                                  color: Colors.grey.shade200,
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
                        // Tooltip(
                        //   message: "فلترة",
                        //   child: InkWell(
                        //     onTap: () {
                        //       AppBottomSheet.show(
                        //         context: context,
                        //         child: FilterClientsSheet(
                        //           onChangeRegion: (value) {
                        //             regoin = value.toString();
                        //             filterShow();
                        //           },
                        //           onChangeClientType: (value) {
                        //             typeclientvalue = value.toString();
                        //             filterShow();
                        //           },
                        //           onResetEmployee: (context) {
                        //             iduser = null;
                        //             filterShow();
                        //             Navigator.pop(context);
                        //           },
                        //           onChangeEmployee: (value) {
                        //             iduser = value.idUser;
                        //             filterShow();
                        //           },
                        //           onChangeActivity: (value) {
                        //             activity = value?.id_activity_type.toString();
                        //             filterShow();
                        //           },
                        //           onResetActivity: (context) {
                        //             activity = null;
                        //             filterShow();
                        //             Navigator.pop(context);
                        //           },
                        //         ),
                        //       );
                        //     },
                        //     borderRadius: BorderRadius.circular(10).r,
                        //     child: Container(
                        //       height: 46,
                        //       width: 46,
                        //       decoration: BoxDecoration(
                        //         color: Colors.grey.shade200,
                        //         borderRadius: BorderRadius.circular(10).r,
                        //       ),
                        //       child: Icon(Icons.filter_alt_rounded, color: Colors.grey.shade600, size: 30.r),
                        //     ),
                        //   ),
                        // ),
                        10.horizontalSpace,
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عدد العملاء',
                          style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                        ),
                        Consumer<ClientProvider>(builder: (context, value, child) {
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
                  Expanded(
                    child: clients.length == 0
                        ? Center(child: Text(messageNoData))
                        : Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount: clients.length,
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                              itemBuilder: (context, index) {
                                return CardAllClient(clientModel: clients[index]);
                              },
                              separatorBuilder: (context, index) => 10.verticalSpace,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void filterShow() {
    context.read<ClientProvider>().filterClient(
          activity: activity,
          idUser: iduser,
          region: regoin,
          typeClient: typeclientvalue,
        );
  }
}
