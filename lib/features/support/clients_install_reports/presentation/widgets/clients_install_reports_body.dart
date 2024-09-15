import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_circular_chart.dart';
import '../../../../../core/common/helpers/number_formatter.dart';
import '../../../../../core/common/widgets/data_table/app_data_table.dart';
import '../../../../../core/common/widgets/data_table/app_data_table_cell.dart';
import '../../../../../core/common/widgets/data_table/app_data_table_column.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_install_reports_cubit.dart';

class ClientsInstallReportsBody extends StatelessWidget {
  const ClientsInstallReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<ClientsInstallReportsCubit>();
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
            child: AppDataTable(
              columns: <DataColumn>[
                AppDataTableColumn('الموظف'),
                AppDataTableColumn('المبيعات'),
                AppDataTableColumn('عدد الفواتير'),
              ],
              rows: _cubit.pageVariables.allList.map((item) {
                return DataRow(
                  cells: <DataCell>[
                    AppDataTableCell(
                      item.x,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    AppDataTableCell(
                      formatNumber(item.y),
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    AppDataTableCell(
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
}
