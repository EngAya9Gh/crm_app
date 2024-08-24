import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../manager/pending_invoices_cubit.dart';

class PendingInvoicesSheet extends StatefulWidget {
  const PendingInvoicesSheet({super.key});

  @override
  State<PendingInvoicesSheet> createState() => _PendingInvoicesSheetState();
}

class _PendingInvoicesSheetState extends State<PendingInvoicesSheet> {
  late final PendingInvoicesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PendingInvoicesCubit>();

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
                  _cubit.filterEntity.regionNotifier.value?.branchId,
              onSelected: (region) {
                return _cubit.filterEntity.regionNotifier.value = region;
              },
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
    _cubit.getPendingInvoices();
    AppNavigator.pop(result: true);
  }
}
