import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/extensions/num_extensions.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../widgets/custom_widget/app_card_row.dart';
import '../widgets/branch_list.dart';

class QuarterPage extends StatefulWidget {
  const QuarterPage({super.key});

  @override
  State<QuarterPage> createState() => _QuarterPageState();
}

class _QuarterPageState extends State<QuarterPage> {
  DateTime datefrom = DateTime(1, 1, 1);

  DateTime dateto = DateTime(1, 1, 3);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.height,
          AppText('السنة*', textDirection: TextDirection.rtl),
          10.height,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
              final years = vm.quarterYearsFilter;
              final selectedYear = vm.selectedQuarterYearFilter;

              return CustomDropDown(
                hint: 'حدد السنة',
                items: years,
                itemAsString: (item) => item!,
                selectedItem: selectedYear.toString(),
                onChanged: (value) {
                  vm.onChangeQuarterYear(value!);
                },
                height: 215.scaleHeight,
              );
            }),
          ),
          10.height,
          AppCardRow(title: 'اختر الربع', value: '*'),
          5.height,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
              final quarters = vm.quartersFilter;
              final selectedQuarter = vm.selectedQuarterFilter;
              return CustomDropDown(
                hint: 'حدد الربع',
                items: quarters,
                itemAsString: (item) => item!,
                selectedItem: selectedQuarter,
                onChanged: (value) {
                  vm.onChangeQuarter(value!);
                },
                height: 215.scaleHeight,
              );
            }),
          ),
          SizedBox(height: 5),
          Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
            final quarterState = vm.quarterState;

            if (quarterState.isLoading) {
              return AppLoader();
            } else if (quarterState.isFailure) {
              return AppErrorWidget(
                onPressed: () => vm.getTargets(),
              );
            }

            final list = quarterState.data ?? [];
            return Expanded(child: BranchList(targetList: list));
          }),
        ],
      ),
    );
  }
}
