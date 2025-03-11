import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/data_table/app_data_table.dart';
import '../../../../../core/common/widgets/data_table/app_data_table_cell.dart';
import '../../../../../core/common/widgets/data_table/app_data_table_column.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;

import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/recommended_client_model.dart';
import '../manager/recommended_client_bloc.dart';

class RecommendedClientsReportPage extends StatefulWidget {
  const RecommendedClientsReportPage({super.key});

  @override
  State<RecommendedClientsReportPage> createState() => _RecommendedClientsReportState();
}

class _RecommendedClientsReportState extends State<RecommendedClientsReportPage> {
  late final RecommendedClientReportsBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<RecommendedClientReportsBloc>()..add(GetRecommendedClientReportsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'تقرير عملاء التوصية',
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<RecommendedClientReportsBloc, RecommendedClientReportsState>(
                  builder: (context, state) {
                    return state.recommendedClientList.when(
                      success: (data) => SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText('عدد العناصر: '),
                                    ((state.recommendedClientList.data ?? []).isEmpty)
                                        ? SizedBox.shrink()
                                        : AppText('${state.recommendedClientList.data?.length ?? ''}/${state.totalDataCount}'),
                                  ],
                                )),
                            10.height,
                            charts.SfCircularChart(
                              series: <charts.PieSeries<RecommendClientsReports, String>>[
                                charts.PieSeries<RecommendClientsReports, String>(
                                  dataSource: data ?? [],
                                  xValueMapper: (RecommendClientsReports data, _) => "${data.numberOfClientsRecommended ?? 0}",
                                  yValueMapper: (RecommendClientsReports data, _) => data.numberOfClientsRecommended ?? 0,
                                  dataLabelMapper: (RecommendClientsReports data, _) => data.nameClient,
                                  dataLabelSettings: charts.DataLabelSettings(
                                    isVisible: true,
                                    labelPosition: charts.ChartDataLabelPosition.outside,
                                  ),
                                  animationDuration: 500,
                                ),
                              ],
                            ),
                            10.height,
                            AppDataTable(
                              columns: <DataColumn>[
                                AppDataTableColumn('رقم العنصر'),
                                AppDataTableColumn('اسم المؤسسة'),
                                // AppDataTableColumn('اسم العميل'),
                                AppDataTableColumn('عملاء التوصية'),
                              ],
                              rows: (data ?? []).mapIndexed((index, item) {
                                return DataRow(
                                  cells: <DataCell>[
                                    AppDataTableCell(
                                      value: (index+1).toString(),
                                      width: MediaQuery.of(context).size.width * 0.1,
                                    ),
                                    AppDataTableCell(
                                      value: item.nameEnterprise,
                                      width: MediaQuery.of(context).size.width * 0.45,
                                    ),
                                    // AppDataTableCell(
                                    //   value: item.nameClient,
                                    //   width: MediaQuery.of(context).size.width * 0.35,
                                    // ),
                                    AppDataTableCell(
                                      value: "${item.numberOfClientsRecommended ?? 0}",
                                      alignment: Alignment.center,
                                      width: .1
                                    ),
                                  ],
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                        onPressed: () => _bloc.add(GetRecommendedClientReportsEvent()),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
