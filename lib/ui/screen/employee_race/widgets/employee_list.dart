import 'package:crm_smart/model/employee_report_model.dart';
import 'package:flutter/material.dart';
import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<EmployeeReportModel> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.3,
      ),
      itemCount: list.length,
      itemBuilder: (_, index) => EmployeeCard(employeeReportModel: list[index]),
    );
  }
}
