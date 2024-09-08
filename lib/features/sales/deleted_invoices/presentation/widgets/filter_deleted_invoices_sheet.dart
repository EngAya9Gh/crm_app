import 'package:crm_smart/core/common/enums/users/user_type_enum.dart';
import 'package:crm_smart/features/common/branches/presentation/pages/branch_searchable_drop_down.dart';
import 'package:crm_smart/features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import '../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';

class FilterDeletedInvoicesSheet extends StatefulWidget {
  const FilterDeletedInvoicesSheet({super.key});

  @override
  State<FilterDeletedInvoicesSheet> createState() =>
      _FilterDeletedInvoicesSheetState();
}

class _FilterDeletedInvoicesSheetState
    extends State<FilterDeletedInvoicesSheet> {
  late final DeletedInvoicesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<DeletedInvoicesCubit>();

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
            BranchSearchableDropDown(
              hint: "الفرع",
              selectedBranchId:
                  _cubit.filterEntity.branchNotifier.value?.branchId,
              onSelected: (branch) {
                return _cubit.filterEntity.branchNotifier.value = branch;
              },
            ),
            10.height,
            UsersSearchableDropDown(
              hint: "الموظف الذي حذف",
              userType: UserTypeEnum.all,
              selectedUserId: _cubit.filterEntity.userNotifier.value?.id,
              onSelected: (user) {
                return _cubit.filterEntity.userNotifier.value = user;
              },
            ),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateToController,
                    style2: true,
                  ),
                ),
              ],
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
    _cubit.getDeletedInvoices();
    AppNavigator.pop(result: true);
  }
}
