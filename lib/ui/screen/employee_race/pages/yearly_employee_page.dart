import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../widgets/employee_list.dart';

class YearlyEmployeePage extends StatefulWidget {
  const YearlyEmployeePage({super.key});

  @override
  State<YearlyEmployeePage> createState() => _YearlyEmployeePageState();
}

class _YearlyEmployeePageState extends State<YearlyEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeRaceViewmodel>(
      builder: (context, vm, _) {
        final selectedYear = vm.selectedYear;
        final employeeYearReportState = vm.employeeYearReportState;

        final list = employeeYearReportState.data ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppText(
                'السنة*',
                textDirection: TextDirection.rtl,
              ),
            ),
            5.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropDown<String>(
                  hint: 'حدد السنة',
                  items: getYearList(),
                  compareFn:  (item, selectedItem) => item == selectedItem,
                  itemAsString: (item) => item!,
                  selectedItem: selectedYear.toString(),
                  onChanged: (value) {
                    vm.onChangeYear(int.parse(value!));
                  },
                  height: 215.scaleHeight,
                  validator: InputValidator.requiredFiled,
                ),
              ),
            ),
            5.height,
            if (employeeYearReportState.isInit)
              SizedBox.shrink()
            else if (employeeYearReportState.isLoading)
              AppLoader()
            else if (employeeYearReportState.isFailure)
              AppErrorWidget(
                message: 'حدث خطأ أثناء تحميل البيانات',
                onPressed: vm.getEmployeeReport,
              )
            else
              list.isEmpty
                  ? Expanded(
                      child:
                          Center(child: AppText("لايوجد بيانات لهذا التاريخ!")))
                  : Expanded(child: EmployeeList(list: list))
          ],
        );
      },
    );
  }
}
