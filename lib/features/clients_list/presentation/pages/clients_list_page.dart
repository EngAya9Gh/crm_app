import 'package:crm_smart/core/utils/search_mixin.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/clients_list/presentation/pages/filter_clients_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../constants.dart';
import '../../../../model/usermodel.dart';
import '../../../../view_model/activity_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/custom_paged_list_view.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/clients_list_bloc.dart';
import '../widgets/client_card.dart';
import 'action_client_page.dart';

class ClientsListPage extends StatefulWidget {
  ClientsListPage({Key? key}) : super(key: key);

  @override
  State<ClientsListPage> createState() => _ClientsListPageState();
  String? privilege, _privilegeRegion;
  bool isSwitch = false;
}

class _ClientsListPageState extends State<ClientsListPage> with SearchMixin {
  late ClientsListBloc _clientsListBloc;
  late final String fkCountry;
  late final UserModel userModel;
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    userModel = context.read<UserProvider>().currentUser;
    _privilegeCubit = GetIt.I<PrivilegeCubit>();

    fkCountry = userModel.fkCountry.toString();
    _clientsListBloc = context.read<ClientsListBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
    });
    super.initState();
    widget.privilege =
        _privilegeCubit.checkPrivilege('16') ? userModel.idUser : null;
    widget._privilegeRegion =
        _privilegeCubit.checkPrivilege('15') ? userModel.fkRegoin : null;
    debugPrint("privilege....${widget.privilege}");
    _clientsListBloc.state.clientsListController
        .addPageRequestListener((pageKey) {
      // if (isSwitch) {
      // _clientsListBloc.add(GetAllClientsListEvent(
      //     fkCountry: fkCountry,
      //     page: pageKey,
      //     userPrivilegeId: widget.privilege,
      //     regionPrivilegeId: widget._privilegeRegion));
      //  }
    });
    initSearch();
  }

  @override
  void deactivate() {
    _clientsListBloc.add(ResetClientList());
    super.deactivate();
  }

  @override
  void dispose() {
    disposeSearch();
    super.dispose();
  }

  @override
  void onSearch(String query) {
    _clientsListBloc.add(SearchEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartCrmAppBar(
        appBarParams: AppBarParams(
          title: 'قائمة العملاء',
          action: [
            if (_privilegeCubit.checkPrivilege('47'))
              AppTextButton(
                text: "إضافة عميل",
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ActionClientPage(),
                      ));
                },
                appButtonStyle: AppButtonStyle.secondary,
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              15.verticalSpace,
              Padding(
                padding:
                    const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
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
                          padding: const EdgeInsets.only(
                              top: 2, left: 8, right: 8, bottom: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: searchController,
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
                        onTap: () {
                          AppBottomSheet.show(
                            context: context,
                            child: FilterClientsSheet(
                              onFilter: (value) {
                                _clientsListBloc.add(
                                    UpdateGetClientsParamsEvent(
                                        getClientsWithFilterParams: value));
                              },
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10).r,
                        child: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          child: Icon(Icons.filter_alt_rounded,
                              color: Colors.grey.shade600, size: 30.r),
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'كل العملاء',
                    style: TextStyle(
                        fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                  ),
                  BlocBuilder<ClientsListBloc, ClientsListState>(
                    builder: (context, state) => Switch(
                        value: widget.isSwitch,
                        // thumb color (round icon)
                        activeColor: Colors.amber,
                        activeTrackColor: Colors.blue.withOpacity(.5),
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 100.0,

                        // changes the state of the switch
                        onChanged: (value) {
                          setState(() {
                            widget.isSwitch = !widget.isSwitch;
                            widget.isSwitch = value;
                          });
                          if (widget.isSwitch == true) {
                            debugPrint("all");
                            _clientsListBloc
                                .state.clientsListController.itemList = [];
                            _clientsListBloc.add(GetAllClientsListEvent(
                                fkCountry: fkCountry,
                                page: 1,
                                userPrivilegeId: null,
                                regionPrivilegeId: widget._privilegeRegion));
                          }
                          if (widget.isSwitch == false) {
                            final String? _privilege =
                                _privilegeCubit.checkPrivilege('16')
                                    ? userModel.idUser
                                    : null;
                            ;
                            debugPrint("ssssss...${_privilege}");

                            _clientsListBloc
                                .state.clientsListController.itemList = [];
                            debugPrint("one${_privilege}");
                            _clientsListBloc.add(GetAllClientsListEvent(
                                fkCountry: fkCountry,
                                page: 1,
                                userPrivilegeId: _privilege,
                                regionPrivilegeId: widget._privilegeRegion));
                            debugPrint("one${_privilege}");
                            //}
                          }
                        }),
                  ),
                ],
              ),
              5.verticalSpace,
              BlocBuilder<ClientsListBloc, ClientsListState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عدد العملاء',
                          style: TextStyle(
                              fontFamily: kfontfamily2,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (_clientsListBloc
                                      .state.clientsListController.itemList ??
                                  [])
                              .length
                              .toString(),
                          style: TextStyle(
                              fontFamily: kfontfamily2,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: CustomPagedListView<int, ClientModel>.separated(
                  pagingController:
                      _clientsListBloc.state.clientsListController,
                  itemBuilder: (context, client, index) => CardClient(
                    clientModel: client,
                    isSwitch: widget.isSwitch,
                  ),
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
