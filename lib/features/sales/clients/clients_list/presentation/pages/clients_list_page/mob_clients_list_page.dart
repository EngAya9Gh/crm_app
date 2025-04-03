import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/sales/clients/clients_list/presentation/widgets/assign_clients_to_employee_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../model/usermodel.dart';
import '../../../../../../../view_model/activity_vm.dart';
import '../../../../../../../view_model/user_vm_provider.dart';
import '../../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../manager/clients_list_bloc.dart';
import '../../widgets/clients_list_count.dart';
import '../../widgets/clients_paginated_list.dart';
import '../../widgets/filter_clients_sheet.dart';
import '../client_add_edit_page.dart';
import '../client_marketing_report_page.dart';

class MobClientsListPage extends StatefulWidget {
  const MobClientsListPage({super.key});

  @override
  State<MobClientsListPage> createState() => _MobClientsListPageState();
}

class _MobClientsListPageState extends State<MobClientsListPage> {
  late final ClientsListBloc _clientsListBloc;
  late final PrivilegesCubit _privilegeCubit;
  late final UserModel userModel;
  bool value1 = false;
  final ValueNotifier<bool> chooseAll = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _clientsListBloc = context.read<ClientsListBloc>()
      ..init()
      ..add(GetUsersSales());
    _privilegeCubit = context.read<PrivilegesCubit>();
    userModel = AppConstants.currentUser;
    _clientsListBloc.state.myclient_parm = false;

    _fetchClients();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Provider.of<UserProvider>(context, listen: false).getAllUsers();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'قائمة العملاء',
          actions: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: BlocConsumer<ClientsListBloc, ClientsListState>(
                listenWhen: (previous, current) {
                  return previous.exportClientsToExcelStatus !=
                      current.exportClientsToExcelStatus;
                },
                listener: (context, state) {
                  if (state.exportClientsToExcelStatus.isFailed()) {
                    AppSnackbar.showSnakeBar(
                      state.exportClientsToExcelStatus.error,
                      color: ToastColorsEnum.error,
                    );
                  }
                },
                buildWhen: (previous, current) {
                  return previous.exportClientsToExcelStatus !=
                      current.exportClientsToExcelStatus;
                },
                builder: (context, state) {
                  if (state.exportClientsToExcelStatus.isLoading()) {
                    return AppLoader(color: AppColors.white);
                  }
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert,
                          color: Colors.white), // Set icon color to white
                      onSelected: (value) {
                        if (value == 'export_excel') {
                          _exportToExcel();
                        } else if (value == 'marketing_report') {
                          AppNavigator.go(ClientMarketingReportPage(),
                              isNew: false);
                        } else if (value == 'add_client') {
                          AppNavigator.go(ClientAddEditPage(), isNew: false);
                        }
                      },
                      itemBuilder: (context) => [
                        if (_privilegeCubit.checkPrivilege('287'))
                          PopupMenuItem(
                            value: 'export_excel',
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: AppText(
                                "Excel تصدير إلى",
                                fontSize: 14.scaleFontSize,
                              ),
                            ),
                          ),
                        if (_privilegeCubit.checkPrivilege('186'))
                          PopupMenuItem(
                            value: 'marketing_report',
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: AppText(
                                "تقرير التسويق",
                                fontSize: 14.scaleFontSize,
                              ),
                            ),
                          ),
                        if (_privilegeCubit.checkPrivilege('47'))
                          PopupMenuItem(
                            value: 'add_client',
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: AppText(
                                "إضافة عميل",
                                fontSize: 14.scaleFontSize,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _clientsListBloc.pageVariables.selectedItemsId,
          builder: (context, listIds, child) => AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (widget, animation) => FadeTransition(
              opacity: animation,
              child: widget,
            ),

            ///determine to show widget depending on listIds content
            child: listIds.isEmpty
                ? SizedBox.shrink()
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 65.w, vertical: 5),
                    child: AppElevatedButton(
                      text: 'تحويل العملاء المحددين',
                      onPressed: () async {
                        final ValueNotifier<UserModel?> selectedUser =
                            ValueNotifier(null);
                        AppConstants.showAppDialog(
                          child: assignClientsToEmployeeDialog(
                              selectedUser: selectedUser,
                              clientsListBloc: _clientsListBloc),
                        );
                      },
                    ),
                  ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4, right: 2, left: 2),
            child: Column(
              children: [
                15.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchWidget(
                        searchController:
                            _clientsListBloc.pageVariables.searchController,
                        onChanged: (value) {
                          _fetchClients(isDebounced: true);
                        },
                      ),
                    ),
                    CustomFilterIcon(
                      onTap: () async {
                        await AppBottomSheet.show(
                          context: context,
                          child: FilterClientsSheet(val: value1),
                        );
                      },
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                5.verticalSpace,
                SwitchListTile(
                  value: _clientsListBloc.filterEntity.isSwitchOnNotifier.value,
                  onChanged: (value) {
                    value1 = value;
                    _clientsListBloc.filterEntity.isSwitchOnNotifier.value =
                        value;
                    setState(() {});

                    _clientsListBloc.filterEntity.statusNotifier.value =
                        value ? ['مشترك'] : [];
                    _fetchClients();

                    ///when change type of client clear all any select
                    _clientsListBloc.pageVariables.selectedItemsId.value = [];
                    chooseAll.value = false;
                  },
                  title: AppText(
                    "انشطة العملاء المشتركين",
                    fontSize: 16.scaleFontSize,
                    style: AppStyles.textStyle,
                  ),
                ),
                5.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ClientsListCount(),
                ),
                if (context.read<PrivilegesCubit>().checkPrivilege('326'))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'اختر الكل',
                          fontSize: 12.scaleFontSize,
                        ),
                        ValueListenableBuilder(
                          valueListenable: chooseAll,
                          builder: (context, value, child) => Checkbox(
                            value: value,
                            onChanged: (value) {
                              ///if value true select all data appear
                              ///else make all data unselected
                              chooseAll.value = value ?? false;
                              if (value ?? false) {
                                _clientsListBloc
                                        .pageVariables.selectedItemsId.value =
                                    List.of(_clientsListBloc
                                        .pageVariables.selectedItemsId.value)
                                      ..addAll((_clientsListBloc
                                              .pageVariables.allList)
                                          .map((e) => e.idClients!));
                              } else {
                                _clientsListBloc
                                    .pageVariables.selectedItemsId.value = [];
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                1.verticalSpace,
                Expanded(
                  child: BlocBuilder<ClientsListBloc, ClientsListState>(
                    buildWhen: (previous, current) {
                      return previous.getAllClientsStatus !=
                              current.getAllClientsStatus &&
                          _clientsListBloc.pageVariables.isNewFilter;
                    },
                    builder: (context, state) {
                      return state.getAllClientsStatus.when(
                        loading: () => AppLoader(),
                        success: (data) {
                          return ClientsPaginatedList(
                            isOnlyAcceptClientActivities: value1,
                            userModel: userModel,
                          );
                        },
                        empty: () => AppErrorWidget(message: 'لا يوجد عملاء'),
                        failure: (error, data) => AppErrorWidget(
                          message: error.toString(),
                          onPressed: () => _fetchClients(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _fetchClients({bool isDebounced = false}) {
    AppConstants.debounceFunction(
      () => _clientsListBloc.add(GetAllClientsListEvent()),
      tag: "search_all_clients_list",
      isDebounced: isDebounced,
    );
  }

  void _exportToExcel() {
    _clientsListBloc.add(ExportClientsToExcelEvent());
  }
}
