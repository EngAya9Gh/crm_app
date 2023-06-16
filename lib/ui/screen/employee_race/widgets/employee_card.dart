import 'package:crm_smart/constants.dart';
import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:crm_smart/view_model/employee_race_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helper/get_month_name.dart';
import '../../../../model/employee_report_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    Key? key,
    required this.employeeReportModel,
  }) : super(key: key);

  final EmployeeReportModel employeeReportModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeRaceViewmodel>(builder: (context, vm, _) {
      final date = vm.selectedDateFilterType == DateFilterType.yearly
          ? vm.selectedYear.toString()
          : vm.selectedDateFilterType == DateFilterType.quarterly
              ? "${getQuarterName(vm.selectedQuarter!)}-${vm.selectedQuarterYear}"
              : "${getMonthName(vm.selectedMonth!)}-${vm.selectedMonthYear}";
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5.0,
        shadowColor: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assest/images/employee.png"), fit: BoxFit.scaleDown),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                ),
                if (employeeReportModel.percentage != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      decoration: BoxDecoration(color: kMainColor, borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text("%" + employeeReportModel.percentage!, style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue.shade800, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    employeeReportModel.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
