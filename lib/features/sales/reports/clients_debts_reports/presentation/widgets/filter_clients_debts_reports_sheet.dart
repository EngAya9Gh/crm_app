import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:crm_smart/features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/reports/invoice_type_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../ui/screen/client/IsmarketCheck_last.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/clients_debts_reports_cubit.dart';

class FilterClientsDebtsReportsSheet extends StatefulWidget {
  const FilterClientsDebtsReportsSheet({super.key});

  @override
  State<FilterClientsDebtsReportsSheet> createState() =>
      _FilterClientsDebtsReportsSheetState();
}

class _FilterClientsDebtsReportsSheetState extends State<FilterClientsDebtsReportsSheet> {
  late final ClientsDebtsReportsCubit _cubit;
  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    _cubit = context.read<ClientsDebtsReportsCubit>();
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
            if (_privilegeCubit.checkPrivilege('94')) ...[
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
            if (_privilegeCubit.checkPrivilege('93') ||
                _privilegeCubit.checkPrivilege('94')) ...[
              10.height,
              BlocBuilder<ClientsListBloc, ClientsListState>(
                builder: (context, state) {
                  return CustomSearchableDropDown(
                    hint: 'الموظف',
                    items: state.usersSales.data??[],
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
            10.height,
            CustomDropDown<InvoiceTypeEnum>(
              hint: 'نوع الفاتورة',
              items: InvoiceTypeEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.invoiceTypeNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.setInvoiceTypeNotifierValue = value!;
              },
              height: 75.h,
            ),
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
    _cubit.getClientDebtsReports();
    AppNavigator.pop(result: true);
  }
}
