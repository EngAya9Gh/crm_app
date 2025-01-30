import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
    return ResponsiveStaggeredGridList(
      desiredItemWidth: 185.scaleWidth,
      children: [...list].map((e) => EmployeeCard(height: 200.scaleHeight,employeeReportModel:e),).toList(),
    );
  }
}
