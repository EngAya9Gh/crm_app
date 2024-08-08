import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/widgets/custom_circular_chart.dart';
import '../../../../../../helper/number_formatter.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/employees_sales_reports_cubit.dart';

class EmployeesSalesReportsBody extends StatelessWidget {
  const EmployeesSalesReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<EmployeesSalesReportsCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText('إجمالي المبيعات'),
              AppText(formatNumber(_cubit.pageVariables.totalValue)),
            ],
          ),
          CustomCircularChart(dataList: _cubit.pageVariables.allList),
          SingleChildScrollView(
            child: DataTable(
              dividerThickness: 2,
              horizontalMargin: 3,
              columnSpacing: 20,
              columns: <DataColumn>[
                _buildDataColumn(context, 'الموظف'),
                _buildDataColumn(context, 'المبيعات'),
                _buildDataColumn(context, 'عدد الفواتير'),
              ],
              rows: _cubit.pageVariables.allList.map((item) {
                return DataRow(
                  cells: <DataCell>[
                    _buildDataCell(context, item.x),
                    _buildDataCell(context, formatNumber(item.y)),
                    _buildDataCell(context, item.countclient.toString()),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  DataColumn _buildDataColumn(BuildContext context, String label) {
    return DataColumn(
      label: AppText(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 12.sp,
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }

  DataCell _buildDataCell(BuildContext context, String value) {
    return DataCell(
      AppText(
        value,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 12.sp,
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }
}
