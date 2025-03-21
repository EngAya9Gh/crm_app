import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/extensions/num_extensions.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../widgets/branch_list.dart';

class YearlyPage extends StatelessWidget {
  const YearlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.height,
          AppText('السنة*', textDirection: TextDirection.rtl),
          5.height,
          Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
            final years = vm.yearsFilter;
            final selectedYear = vm.selectedYearFilter;
            return CustomDropDown(
              hint: 'حدد السنة',
              items: years,
              compareFn:  (item, selectedItem) => item == selectedItem,
              itemAsString: (item) => item!,
              selectedItem: selectedYear,
              onChanged: (value) {
                vm.onChangeYear(value!);
              },
              height: 215.scaleHeight,
            );
          }),
          10.height,
          Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
            final yearlyState = vm.yearlyState;

            if (yearlyState.isLoading) {
              return AppLoader();
            } else if (yearlyState.isFailure) {
              return AppErrorWidget(
                onPressed: () => vm.onChangeYear(DateTime.now().year.toString()),
              );
            }

            final list = yearlyState.data ?? [];
            return Expanded(child: BranchList(targetList: list,onPressed: () {
              return vm.onChangeYear(DateTime.now().year.toString());
            },));
          }),
        ],
      ),
    );
  }
}
