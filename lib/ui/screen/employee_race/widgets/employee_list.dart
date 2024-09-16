import 'package:crm_smart/core/common/widgets/app_paginated_grid.dart';
import 'package:flutter/material.dart';

import '../../../../model/employee_report_model.dart';
import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<EmployeeReportModel> list;

  @override
  Widget build(BuildContext context) {
    return AppPaginatedGridView(
      items: list,
      itemBuilder: (_, index) => EmployeeCard(employeeReportModel: list[index]),
    );
  }
}
