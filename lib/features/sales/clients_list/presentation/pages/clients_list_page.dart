import 'package:crm_smart/core/common/widgets/custom_filter_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/search_mixin.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/sales/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/pages/client_marketing_report_page.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/pages/filter_clients_sheet.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/activity_vm.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../app/presentation/widgets/custom_paged_list_view.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/clients_list_bloc.dart';
import '../widgets/client_card.dart';
import '../widgets/client_card_pluse.dart';
import 'client_add_edit_page.dart';

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
        userPrivilegeId: userModel.idUser,
        regionPrivilegeId: userModel.fkRegoin,
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
            if (_privilegeCubit.checkPrivilege('186')) ...[
              Directionality(
                textDirection: TextDirection.rtl,
                child: AppTextButton(
                  text: "تقرير\nالتسويق",
                  onPressed: () {
                    AppNavigator.push(ClientMarketingReportPage());
                    _clientsListBloc.add(GetClientMarketingReportEvent());
                  },
                  appButtonStyle: AppButtonStyle.secondary,
                ),
              ),
            ],
            if (_privilegeCubit.checkPrivilege('47')) ...[
              Directionality(
                textDirection: TextDirection.rtl,
                child: AppTextButton(
                  text: "إضافة\nعميل",
                  onPressed: () => AppNavigator.push(ClientAddEditPage()),
                  appButtonStyle: AppButtonStyle.secondary,
                ),
              ),
            ],
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
                    child: CustomSearchWidget(
                      searchController: searchController!,
                    ),
                  ),
                  CustomFilterIcon(
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
                  ),
                  SizedBox(width: 8),
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
                      fkCountry: fkCountry,
                      typeClient: 'مشترك',
                    )));
                  else
                    _clientsListBloc.add(UpdateGetClientsParamsEvent(
                        getClientsWithFilterParams: _clientsListBloc
                            .state.getClientsWithFilterParams!
                            .copyWith(fkCountry: fkCountry)));
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
                        padding: const EdgeInsets.only(left: 20.0, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'عدد العملاء',
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  fontWeight: FontWeight.bold),
                            ),
                            // _clientsListBloc.
                            // "current / total"
                            Text(
                              "${state.clientsListController.itemList?.length ?? 0} / ${_clientsListBloc.totalNumberOfClients}",
                              textDirection: TextDirection.ltr,
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
