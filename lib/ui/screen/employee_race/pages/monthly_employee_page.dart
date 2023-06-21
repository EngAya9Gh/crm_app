import 'package:crm_smart/view_model/employee_race_viewmodel.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helper/get_month_name.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/employee_list.dart';

class MonthlyEmployeePage extends StatefulWidget {
  const MonthlyEmployeePage({Key? key}) : super(key: key);

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

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'السنة', des: '*'),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DropdownButtonFormField<int>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    hint: Text("حدد السنة"),
                    items: getYearList().map((String str) {
                      return DropdownMenuItem<int>(
                        child: Text(str, textDirection: TextDirection.rtl),
                        value: int.parse(str),
                      );
                    }).toList(),
                    value: selectedMonthYear,
                    onChanged: (year) {
                      if (year == null) {
                        return;
                      }
                      vm.onChangeMonthYear(year);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'الشهر', des: '*'),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DropdownButtonFormField<int>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    hint: Text("حدد الشهر"),
                    items: monthList.map((String str) {
                      return DropdownMenuItem<int>(
                        child: Text(str, textDirection: TextDirection.rtl),
                        value: getMonthNumber(str),
                      );
                    }).toList(),
                    value: selectedMonth,
                    onChanged: (month) {
                      if (month == null) {
                        return;
                      }
                      vm.onChangeMonth(month);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            if (employeeMonthReportState.isInit)
              SizedBox.shrink()
            else if (employeeMonthReportState.isLoading)
              Center(child: CircularProgressIndicator.adaptive())
            else if (employeeMonthReportState.isFailure)
              Center(child: IconButton(onPressed: vm.getEmployeeReport, icon: Icon(Icons.refresh)))
            else
              list.isEmpty
                  ? Center(child: Text("لايوجد بيانات لهذا التاريخ!"))
                  : Expanded(child: EmployeeList(list: list)),
          ],
        );
      },
    );
  }
}
