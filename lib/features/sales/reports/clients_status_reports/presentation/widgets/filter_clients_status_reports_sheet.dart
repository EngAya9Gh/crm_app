import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../ui/screen/client/IsmarketCheck_last.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/clients_status_reports_cubit.dart';

class FilterClientsStatusReportsSheet extends StatefulWidget {
  const FilterClientsStatusReportsSheet({super.key});

  @override
  State<FilterClientsStatusReportsSheet> createState() =>
      _FilterClientsStatusReportsSheetState();
}

class _FilterClientsStatusReportsSheetState
    extends State<FilterClientsStatusReportsSheet> {
  late final ClientsStatusReportsCubit _cubit;
  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    _cubit = context.read<ClientsStatusReportsCubit>();
    _privilegeCubit = context.read<PrivilegesCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _cubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _cubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            10.height,
            IsMarketingCheckbox_last(
              isMarketingNotifier: _cubit.filterEntity.isMarketingNotifier,
              onChange: (value) {
                _cubit.filterEntity.isMarketingNotifier.value = value;
              },
            ),
            10.height,
            CustomDropDown<PeriodTypeEnum>(
              hint: 'الفترة',
              items: PeriodTypeEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.periodTypeNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.periodTypeNotifier.value = value!;
                _cubit.filterEntity.changeReportTypeAccordingToPeriod();
                _cubit.filterEntity.changeDateAccordingToPeriod();
              },
              height: 105.h,
            ),
            10.height,
            ValueListenableBuilder(
              valueListenable: _cubit.filterEntity.periodTypeNotifier,
              builder: (context, value, child) {
                if (_cubit.filterEntity.periodTypeNotifier.value == null) {
                  return SizedBox.shrink();
                }
                return Row(
                  children: [
                    Flexible(
                      child: CustomDateTimePicker(
                        dateTimeController:
                            _cubit.filterEntity.dateFromController,
                        dateTimeType: DateTimeEnum.date,
                        hintText: 'وقت البداية',
                        style2: true,
                      ),
                    ),
                    if (_cubit
                        .filterEntity.periodTypeNotifier.value!.isDaily) ...[
                      10.width,
                      Flexible(
                        child: CustomDateTimePicker(
                          dateTimeController:
                              _cubit.filterEntity.dateToController,
                          dateTimeType: DateTimeEnum.date,
                          hintText: 'وقت النهاية',
                          style2: true,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
            if (_privilegeCubit.checkPrivilege('98')) ...[
              10.height,
              BranchSearchableDropDown(
                hint: 'الفرع',
                selectedBranchId:
                    _cubit.filterEntity.regionNotifier.value?.branchId,
                onSelected: (region) {
                  _cubit.filterEntity.regionNotifier.value = region;
                },
              ),
            ],
            if (_privilegeCubit.checkPrivilege('97') ||
                _privilegeCubit.checkPrivilege('98')) ...[
              10.height,
              Consumer<UserProvider>(
                builder: (context, userVm, child) {
                  return CustomSearchableDropDown<UserModel>(
                    hint: 'الموظف',
                    items: userVm.usersSalesManagement,
                    itemAsString: (u) => u!.userAsString(),
                    onChanged: (data) {
                      if (data == null) return;
                      _cubit.filterEntity.userNotifier.value = data;
                    },
                    selectedItem: _cubit.filterEntity.userNotifier.value,
                    filterFn: (user, filter) => user.getfilteruser(filter),
                  );
                },
              ),
            ],
            20.height,
            AppElevatedButton(
              text: "فلترة",
              onPressed: () => _filterAndCloseDialog(),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _cubit.getClientsStatusReports();
    AppNavigator.pop(result: true);
  }
}
