import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/extensions/num_extensions.dart';
import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../../../widgets/custom_widget/app_card_row.dart';
import '../widgets/branch_list.dart';

class MonthlyPage extends StatefulWidget {
  const MonthlyPage({super.key});

  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  late String selectedYear = '2020';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            AppText('اختر السنة', textDirection: TextDirection.rtl),
            5.height,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
                final selectedMonthYearFilter = vm.selectedMonthYearFilter;

                return CustomDropDown(
                  hint: 'حدد السنة',
                  items: getYears(),
                  itemAsString: (item) => item!,
                  selectedItem: selectedMonthYearFilter,
                  onChanged: (value) {
                    vm.onChangeMonthYear(value!);
                  },
                  height: 215.scaleHeight,
                );
              }),
            ),
            10.height,
            AppCardRow(title: 'اختر الشهر', value: '*'),
            5.height,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(
                builder: (context, vm, _) {
                  final months = vm.monthsFilter;
                  final selectedMonth = vm.selectedMonthFilter;

                  return CustomDropDown(
                    hint: 'حدد الشهر',
                    items: months,
                    itemAsString: (item) => item!,
                    selectedItem: selectedMonth,
                    onChanged: (value) {
                      vm.onChangeMonth(value!);
                    },
                    height: 215.scaleHeight,
                  );
                },
              ),
            ),
            10.height,
            Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
              final monthlyState = vm.monthlyState;

              if (monthlyState.isLoading) {
                AppLoader();
              } else if (monthlyState.isFailure) {
                AppErrorWidget(
                  onPressed: () => vm.getTargets(),
                );
              }

              final list = monthlyState.data ?? [];
              return Expanded(child: BranchList(targetList: list));
            }),
          ],
        ),
      ),
    );
  }
}
