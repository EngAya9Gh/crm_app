import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../widgets/employee_list.dart';

class MonthlyEmployeePage extends StatefulWidget {
  const MonthlyEmployeePage({super.key});

  @override
  State<MonthlyEmployeePage> createState() => _MonthlyEmployeePageState();
}

class _MonthlyEmployeePageState extends State<MonthlyEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeRaceViewmodel>(
      builder: (context, vm, _) {
        final selectedMonth = vm.selectedMonth;
        final selectedMonthYear = vm.selectedMonthYear;
        final employeeMonthReportState = vm.employeeMonthReportState;

        final list = employeeMonthReportState.data ?? [];

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
                  selectedItem: selectedMonthYear.toString(),
                  onChanged: (value) {
                    vm.onChangeMonthYear(int.parse(value!));
                  },
                  height: 215.scaleHeight,
                  validator: InputValidator.requiredFiled,
                ),
              ),
              10.height,
              AppText('الشهر*', textDirection: TextDirection.rtl),
              5.height,
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropDown(
                  hint: 'حدد الشهر',
                  items: monthList,
                  itemAsString: (item) => item!,
                  selectedItem: getMonthName(selectedMonth!),
                  onChanged: (value) {
                    vm.onChangeMonth(getMonthNumber(value!));
                  },
                  validator: InputValidator.requiredFiled,
                ),
              ),
              5.height,
              if (employeeMonthReportState.isInit)
                SizedBox.shrink()
              else if (employeeMonthReportState.isLoading)
                Center(child: CircularProgressIndicator.adaptive())
              else if (employeeMonthReportState.isFailure)
                Center(
                    child: IconButton(
                        onPressed: vm.getEmployeeReport,
                        icon: Icon(Icons.refresh)))
              else
                list.isEmpty
                    ? Center(child: Text("لايوجد بيانات لهذا التاريخ!"))
                    : Expanded(child: EmployeeList(list: list)),
            ],
          ),
        );
      },
    );
  }
}
