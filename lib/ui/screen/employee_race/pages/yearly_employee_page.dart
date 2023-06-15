import 'package:crm_smart/view_model/employee_race_viewmodel.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helper/get_month_name.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/employee_list.dart';

class YearlyEmployeePage extends StatefulWidget {
  const YearlyEmployeePage({Key? key}) : super(key: key);

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
                  child: DropdownButtonFormField<int?>(
                    isExpanded: true,
                    validator: (value) {
                      if (value == null) {
                        return "هذا الحقل مطلوب";
                      }
                    },
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
                    value: selectedYear,
                    onChanged: (year) {
                      if (year == null) {
                        return;
                      }
                      vm.onChangeYear(year);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            if (employeeYearReportState.isInit)
              SizedBox.shrink()
            else if (employeeYearReportState.isLoading)
              Center(child: CircularProgressIndicator.adaptive())
            else if (employeeYearReportState.isFailure)
              Center(child: IconButton(onPressed: vm.getEmployeeReport, icon: Icon(Icons.refresh)))
            else
              list.isEmpty
                  ? Center(child: Text("لايوجد بيانات لهذا التاريخ!"))
                  : Expanded(child: EmployeeList(list: list))
          ],
        );
      },
    );
  }
}
