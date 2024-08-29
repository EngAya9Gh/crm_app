import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import '../manager/withdrawn_invoices_cubit.dart';

class FilterWithdrawnInvoicesSheet extends StatefulWidget {
  const FilterWithdrawnInvoicesSheet({
    Key? key,
  });

  @override
  State<FilterWithdrawnInvoicesSheet> createState() =>
      _FilterWithdrawnInvoicesSheetState();
}

class _FilterWithdrawnInvoicesSheetState
    extends State<FilterWithdrawnInvoicesSheet> {
  late final WithdrawnInvoicesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<WithdrawnInvoicesCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 30),
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
              selectedBranchId:
                  _cubit.filterEntity.branchNotifier.value?.branchId,
              onSelected: (branch) {
                _cubit.filterEntity.branchNotifier.value = branch;
              },
            ),
            10.height,
            UsersSearchableDropDown(
              hint: "الموظف الذي قام بانسحاب الفاتورة",
              userType: UserTypeEnum.all,
              selectedUserId: _cubit.filterEntity.userNotifier.value?.id,
              onSelected: (user) {
                return _cubit.filterEntity.userNotifier.value = user;
              },
            ),
            20.height,
            AppElevatedButton(
              text: 'فلترة',
              width: double.infinity,
              onPressed: () => _filterAndCloseDialog(),
            ),
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _cubit.getWithdrawnInvoices();
    AppNavigator.pop(result: true);
  }
}
