import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_circular_chart.dart';
import '../../../../../../helper/number_formatter.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_care_reports_cubit.dart';

class ClientsCareReportsBody extends StatelessWidget {
  const ClientsCareReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<ClientsCareReportsCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText('إجمالي'),
              AppText(formatNumber(_cubit.pageVariables.totalValue)),
            ],
          ),
          CustomCircularChart(dataList: _cubit.pageVariables.allList),
          SingleChildScrollView(
            child: DataTable(
              dividerThickness: 2,
              horizontalMargin: 3,
              columnSpacing: 5,
              columns: <DataColumn>[
                _buildDataColumn(context, 'الموظف'),
                _buildDataColumn(context, 'المبيعات'),
                _buildDataColumn(context, 'عدد الفواتير'),
              ],
              rows: _cubit.pageVariables.allList.map((item) {
                return DataRow(
                  cells: <DataCell>[
                    _buildDataCell(
                      context,
                      item.x,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    _buildDataCell(
                      context,
                      formatNumber(item.y),
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    _buildDataCell(
                      context,
                      item.countclient.toString(),
                      alignment: Alignment.center,
                    ),
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
        textAlign: TextAlign.center,
        fontSize: (16.0).scaleFontSize,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  DataCell _buildDataCell(
    BuildContext context,
    String value, {
    Alignment? alignment,
    double? width,
  }) {
    return DataCell(
      Align(
        alignment: alignment ?? Alignment.centerRight,
        child: SizedBox(
          width: width,
          child: AppText(
            value,
            fontSize: (16.0).scaleFontSize,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
