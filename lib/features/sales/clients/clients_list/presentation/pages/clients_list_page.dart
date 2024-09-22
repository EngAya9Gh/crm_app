import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/clients_list_bloc.dart';
import '../widgets/clients_list_count.dart';
import '../widgets/clients_paginated_list.dart';
import '../widgets/filter_clients_sheet.dart';
import 'client_add_edit_page.dart';
import 'client_marketing_report_page.dart';

class ClientsListPage extends StatefulWidget {
  const ClientsListPage({super.key});

  @override
  State<ClientsListPage> createState() => _ClientsListPageState();
}

class _ClientsListPageState extends State<ClientsListPage> {
  late final ClientsListBloc _clientsListBloc;
  late final PrivilegesCubit _privilegeCubit;
  late final String fkCountry;
  late final UserModel userModel;
  bool value1 = false;

  @override
  void initState() {
    super.initState();
    _clientsListBloc = context.read<ClientsListBloc>()..init();
    _privilegeCubit = context.read<PrivilegesCubit>();
    userModel = AppConstants.currentUser;
    fkCountry = AppConstants.currentCountry;
    _clientsListBloc.state.myclient_parm = false;

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
      appBar: CustomAppBar(
        title: 'قائمة العملاء',
        actions: [
          if (_privilegeCubit.checkPrivilege('186')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppTextButton(
                text: "تقرير\nالتسويق",
                onPressed: () {
                  AppNavigator.go(ClientMarketingReportPage(), isNew: false);
                },
                appButtonStyle: AppButtonStyle.secondary,
                textStyle: AppStyles.textStyle.copyWith(
                  fontSize: (16.0).scaleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
          if (_privilegeCubit.checkPrivilege('47')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppTextButton(
                text: "إضافة\nعميل",
                onPressed: () =>
                    AppNavigator.go(ClientAddEditPage(), isNew: false),
                textStyle:
                AppStyles.textStyle.copyWith(
                  fontSize: (16.0).scaleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2,
                  color: AppColors.white,
                ),
                appButtonStyle: AppButtonStyle.secondary,
              ),
            ),
          ],
        ],
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
                },
                title: AppText(
                  "انشطة العملاء المشتركين",
                  style: AppStyles.textStyle,
                ),
              ),
              5.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ClientsListCount(),
              ),
              5.verticalSpace,
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
    );
  }

  void _fetchClients({bool isDebounced = false}) {
    AppConstants.debounceFunction(
      () {
        _clientsListBloc.add(GetAllClientsListEvent(
          fkCountry: fkCountry,
        ));
      },
      tag: "search_all_clients_list",
      isDebounced: isDebounced,
    );
  }
}
