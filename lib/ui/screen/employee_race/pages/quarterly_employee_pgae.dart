import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/common/helpers/input_validator.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../widgets/employee_list.dart';

class QuarterlyEmployeePage extends StatefulWidget {
  const QuarterlyEmployeePage({super.key});

  @override
  State<QuarterlyEmployeePage> createState() => _QuarterlyEmployeePageState();
}

class _QuarterlyEmployeePageState extends State<QuarterlyEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeRaceViewmodel>(
      builder: (context, vm, _) {
        final selectedQuarter = vm.selectedQuarter;
        final selectedQuarterYear = vm.selectedQuarterYear;
        final employeeQuarterReportState = vm.employeeQuarterReportState;

        final list = employeeQuarterReportState.data ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText('السنة*', textDirection: TextDirection.rtl),
              5.height,
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropDown(
                  hint: 'حدد السنة',
                  items: getYearList(),
                  itemAsString: (item) => item!,
                  selectedItem: selectedQuarterYear.toString(),
                  onChanged: (value) {
                    vm.onChangeQuarterYear(int.parse(value!));
                  },
                  height: 215.scaleHeight,
                  validator: InputValidator.requiredFiled,
                ),
              ),
              10.height,
              AppText('الربع*', textDirection: TextDirection.rtl),
              5.height,
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropDown(
                  hint: 'حدد الربع',
                  items: quarterList,
                  itemAsString: (item) => item!,
                  selectedItem: getQuarterName(selectedQuarter!),
                  onChanged: (value) {
                    vm.onChangeQuarter(getQuarterNumber(value!));
                  },
                  height: 175.scaleHeight,
                ),
              ),
              10.height,
              if (employeeQuarterReportState.isInit)
                SizedBox.shrink()
              else if (employeeQuarterReportState.isLoading)
                AppLoader()
              else if (employeeQuarterReportState.isFailure)
                AppErrorWidget(
                  message: 'حدث خطأ أثناء تحميل البيانات',
                  onPressed: vm.getEmployeeReport,
                )
              else
                list.isEmpty
                    ? Expanded(
                        child: Center(
                            child: AppText("لايوجد بيانات لهذا التاريخ!")))
                    : Expanded(child: EmployeeList(list: list)),
            ],
          ),
        );
      },
    );
  }
}
