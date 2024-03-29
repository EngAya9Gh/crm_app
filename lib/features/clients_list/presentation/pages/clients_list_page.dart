import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/core/utils/search_mixin.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/clients_list/presentation/pages/filter_clients_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';
import '../../../../core/common/models/nullable.dart';
import '../../../../core/di/di_container.dart';
import '../../../../model/usermodel.dart';
import '../../../../view_model/activity_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/custom_paged_list_view.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/clients_list_bloc.dart';
import '../widgets/client_card.dart';
import '../widgets/client_card_pluse.dart';
import 'action_client_page.dart';

class ClientsListPage extends StatefulWidget {
  const ClientsListPage({Key? key}) : super(key: key);

  @override
  State<ClientsListPage> createState() => _ClientsListPageState();
}

class _ClientsListPageState extends State<ClientsListPage> with SearchMixin {
  late ClientsListBloc _clientsListBloc;
  late final String fkCountry;
  late final UserModel userModel;
  late PrivilegeCubit _privilegeCubit;
  bool value1 = false;

  @override
  void initState() {
    userModel = context.read<UserProvider>().currentUser;
    _privilegeCubit = getIt<PrivilegeCubit>();

    fkCountry = userModel.fkCountry.toString();
    _clientsListBloc = context.read<ClientsListBloc>();
    _clientsListBloc.state.myclient_parm = false;
    _clientsListBloc.state.clientsListController
        .addPageRequestListener((pageKey) {
      _clientsListBloc.add(GetAllClientsListEvent(
        fkCountry: fkCountry,
        page: pageKey,
        userPrivilegeId:
            _privilegeCubit.checkPrivilege('16') ? userModel.idUser : null,
        regionPrivilegeId:
            _privilegeCubit.checkPrivilege('15') ? userModel.fkRegoin : null,
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
    });
    super.initState();
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              15.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: TextField(
                        controller: searchController,
                        textInputAction: TextInputAction.search,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: hintnamefilter,
                          hintStyle: context.textTheme.titleSmall?.copyWith(
                            fontSize: 12.sp,
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
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
                            val: value1,
                            onFilter: (value) {
                              _clientsListBloc.add(UpdateGetClientsParamsEvent(
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
              5.verticalSpace,
              SwitchListTile(
                value: value1,
                onChanged: (value) {
                  setState(() {
                    value1 = value;
                  });
                  _clientsListBloc.add(SwitchEvent(mycl: value));

                  if (value)
                    _clientsListBloc.add(UpdateGetClientsParamsEvent(
                        getClientsWithFilterParams: _clientsListBloc
                            .state.getClientsWithFilterParams!
                            .copyWith(
                      country: Nullable.value(fkCountry),
                      typeClient: Nullable.value('مشترك'),
                      userPrivilegeId: Nullable.value(null),
                      regionPrivilegeId: Nullable.value(null),
                    )));
                  else
                    _clientsListBloc.add(UpdateGetClientsParamsEvent(
                        getClientsWithFilterParams: _clientsListBloc
                            .state.getClientsWithFilterParams!
                            .copyWith(
                      userPrivilegeId: Nullable.value(
                          _privilegeCubit.checkPrivilege('16')
                              ? userModel.idUser
                              : null),
                      regionPrivilegeId: Nullable.value(
                          _privilegeCubit.checkPrivilege('15')
                              ? userModel.fkRegoin
                              : null),
                      country: Nullable.value(fkCountry),
                      typeClient: Nullable.value(null),
                    )));
                },
                title: Text("كل العملاء"),
              ),
              5.verticalSpace,
              BlocBuilder<ClientsListBloc, ClientsListState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      // SwitchListTile(value: value, onChanged: (v){setState(() {
                      //   value=v;
                      // });}),

                      Padding(
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
                              (_clientsListBloc.state.clientsListController
                                          .itemList ??
                                      [])
                                  .length
                                  .toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: CustomPagedListView<int, ClientModel>.separated(
                  pagingController:
                      _clientsListBloc.state.clientsListController,
                  itemBuilder: (context, client, index) => value1 == true
                      ? CardClient_pluse(clientModel: client)
                      : CardClient(clientModel: client),
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
