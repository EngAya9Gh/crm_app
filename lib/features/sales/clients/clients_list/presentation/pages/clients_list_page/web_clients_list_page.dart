import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/enums/client/subscribing_intention_level_enum.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_copyrights_widget.dart';
import 'package:crm_smart/core/common/widgets/data_table/app_data_table.dart';
import 'package:crm_smart/core/common/widgets/data_table/app_data_table_cell.dart';
import 'package:crm_smart/core/common/widgets/data_table/app_data_table_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../../core/common/widgets/web/pagination_controls.dart';
import '../../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../core/utils/app_fonts.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../model/usermodel.dart';
import '../../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../../../view_model/activity_vm.dart';
import '../../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../manager/clients_list_bloc.dart';
import '../../widgets/filter_clients_sheet.dart';
import '../client_add_edit_page.dart';
import '../client_marketing_report_page.dart';

class WebClientsListPage extends StatefulWidget {
  const WebClientsListPage({super.key});

  @override
  State<WebClientsListPage> createState() => _WebClientsListPageState();
}

class _WebClientsListPageState extends State<WebClientsListPage> {
  late final ClientsListBloc _clientsBloc;
  late final PrivilegesCubit _privilegeCubit;
  late final UserModel userModel;
  bool value1 = false;

  @override
  void initState() {
    super.initState();
    _clientsBloc = context.read<ClientsListBloc>()..init();
    _privilegeCubit = context.read<PrivilegesCubit>();
    userModel = AppConstants.currentUser;
    _clientsBloc.state.myclient_parm = false;

    _fetchClients();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(
            child: AppCardContainer(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 0),
              margin: EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText('قائمة العملاء', fontWeight: FontWeight.bold),
                        Spacer(),
                        if (_privilegeCubit.checkPrivilege('47')) ...[
                          AppElevatedButton(
                            text: "إضافة عميل",
                            onPressed: () => AppNavigator.go(
                                ClientAddEditPage(),
                                isNew: false),
                          ),
                        ],
                        SizedBox(width: 16),
                        if (_privilegeCubit.checkPrivilege('186')) ...[
                          SizedBox(
                            child: AppElevatedButton(
                              text: "تقرير التسويق",
                              onPressed: () {
                                AppNavigator.go(ClientMarketingReportPage(),
                                    isNew: false);
                              },
                              appButtonStyle: AppButtonStyle.secondary,
                              textStyle: AppStyles.textStyle.copyWith(
                                fontSize: (16.0).scaleFontSize,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFonts.fontFamily1,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(width: 16),
                        if (_privilegeCubit.checkPrivilege('287')) ...[
                          BlocConsumer<ClientsListBloc, ClientsListState>(
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
                              return AppElevatedButton(
                                isLoading: state.exportClientsToExcelStatus
                                    .isLoading(),
                                text: "تصدير إلى Excel",
                                onPressed: () {
                                  _clientsBloc.add(ExportClientsToExcelEvent());
                                },
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        Checkbox(
                            value: _clientsBloc
                                .filterEntity.isSwitchOnNotifier.value,
                            onChanged: (value) {
                              value1 = value!;
                              _clientsBloc.filterEntity.isSwitchOnNotifier
                                  .value = value;
                              setState(() {});
                              _clientsBloc.filterEntity.statusNotifier.value =
                                  value ? ['مشترك'] : [];
                              _fetchClients();
                            }),
                        AppText('أنشطة العملاء المشتركين'),
                        SizedBox(width: 8),
                        35.horizontal,
                        Expanded(
                          child: CustomSearchWidget(
                            searchController:
                                _clientsBloc.pageVariables.searchController,
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
                    10.height,
                    Expanded(
                      child: BlocBuilder<ClientsListBloc, ClientsListState>(
                        buildWhen: (previous, current) {
                          return previous.getAllClientsStatus !=
                              current.getAllClientsStatus;
                        },
                        builder: (context, state) {
                          return state.getAllClientsStatus.when(
                            loading: () => AppLoader(),
                            success: (data) {
                              final clients =
                                  _clientsBloc.pageVariables.allList;
                              return AppDataTable(
                                columns: [
                                  _buildDataTableColumn('الرقم المرجعي'),
                                  _buildDataTableColumn('العميل'),
                                  _buildDataTableColumn('المؤسسة'),
                                  _buildDataTableColumn('تاريخ الإضافة'),
                                  _buildDataTableColumn('نوع العميل'),
                                  _buildDataTableColumn('الأولوية'),
                                  _buildDataTableColumn('الأمر'),
                                ],
                                rows: clients.mapIndexed(
                                  (index, client) {
                                    return DataRow(
                                      color: WidgetStateProperty.all(
                                        index.isOdd
                                            ? Colors.grey.shade100
                                            : AppColors.white,
                                      ),
                                      cells: [
                                        AppDataTableCell(
                                            value: client.serialNumber ?? ''),
                                        AppDataTableCell(
                                            value: client.nameClient ?? ''),
                                        AppDataTableCell(
                                            value: client.nameEnterprise ?? ''),
                                        AppDataTableCell(
                                            value: client.dateCreate ?? ''),
                                        AppDataTableCell(
                                            value: client.typeClient ?? ''),
                                        AppDataTableCell(
                                          icon: AppIcon(
                                            Icons.flag,
                                            color: client
                                                .subscribingIntentionLevel
                                                ?.color,
                                          ),
                                        ),
                                        AppDataTableCell(
                                          icon: InkWell(
                                            onTap: () {
                                              if (!value1) {
                                                // AppNavigator.go(
                                                //   ClientProfile(idClient: client.idClients),
                                                //   isNew: false,
                                                // );
                                                AppNavigator.go(
                                                  ClientProfile(
                                                      idClient:
                                                          client.idClients),
                                                  name: AppRoutesNames
                                                      .clientProfile
                                                      .inClientsList,
                                                  extra: {
                                                    'idClient': client.idClients
                                                        .toString()
                                                  },
                                                );
                                              }
                                            },
                                            child: AppIcon(
                                              Icons.remove_red_eye,
                                              color: AppColors.primaryMain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ).toList(),
                              );
                            },
                            empty: () =>
                                AppErrorWidget(message: 'لا يوجد عملاء'),
                            failure: (error, _) => AppErrorWidget(
                              message: error.toString(),
                              onPressed: () => _fetchClients(),
                            ),
                          );
                        },
                      ),
                    ),
                    10.height,
                    BlocBuilder<ClientsListBloc, ClientsListState>(
                      builder: (context, state) {
                        return PaginationControls(
                          currentPage: state.currentPage ?? 1,
                          totalPages: _clientsBloc.pageVariables.totalPages,
                          onPageChanged: (page) {
                            _clientsBloc
                                .add(GetAllClientsListEvent(pageWeb: page));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppCardContainer(
            margin: EdgeInsets.all(10),
            child: AppCopyrightsWidget(),
          ),
        ],
      ),
    );
  }

  DataColumn _buildDataTableColumn(String value) {
    return AppDataTableColumn(value);
  }

  void _fetchClients({bool isDebounced = false}) {
    AppConstants.debounceFunction(
      () {
        _clientsBloc.add(GetAllClientsListEvent());
      },
      tag: "search_all_clients_list",
      isDebounced: isDebounced,
    );
  }
}
