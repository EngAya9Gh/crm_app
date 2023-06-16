import 'package:crm_smart/helper/get_month_name.dart';
import 'package:crm_smart/ui/screen/employee_race/widgets/employee_list.dart';
import 'package:crm_smart/view_model/employee_race_viewmodel.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../widgets/custom_widget/row_edit.dart';

class QuarterlyEmployeePage extends StatefulWidget {
  const QuarterlyEmployeePage({Key? key}) : super(key: key);

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

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'السنة', des: 'Required'),
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
                    value: selectedQuarterYear,
                    onChanged: (quarterYear) {
                      if (quarterYear == null) {
                        return;
                      }

                      vm.onChangeQuarterYear(quarterYear);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'الربع', des: 'Required'),
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
                    hint: Text("حدد الربع"),
                    items: quarterList.map((String str) {
                      return DropdownMenuItem<int>(
                        child: Text(str, textDirection: TextDirection.rtl),
                        value: getQuarterNumber(str),
                      );
                    }).toList(),
                    value: selectedQuarter,
                    onChanged: (quarter) {
                      if (quarter == null) {
                        return;
                      }
                      vm.onChangeQuarter(quarter);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            if (employeeQuarterReportState.isInit)
              SizedBox.shrink()
            else if (employeeQuarterReportState.isLoading)
              Center(child: CircularProgressIndicator.adaptive())
            else if (employeeQuarterReportState.isFailure)
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
