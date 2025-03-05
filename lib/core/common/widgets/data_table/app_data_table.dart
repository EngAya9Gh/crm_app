import 'package:crm_smart/core/common/widgets/shimmer_widget.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'app_data_table_cell.dart';

class AppDataTable extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.showCheckboxColumn = false,
    this.onSelectAll,
    this.scrollController,
    this.scrollControllerForPagination,
    this.horizontalMargin,
    this.columnSpacing,
    this.isLoading = false,
    this.hasReachedEnd = false,
    this.onLoadMore,
    this.loadingRow,
  });

  final List<DataColumn> columns;
  final bool isLoading;
  final bool hasReachedEnd;
  final Function? onLoadMore;
  final List<DataRow> rows;
  final DataRow? loadingRow;
  final ScrollController? scrollController;
  final ScrollController? scrollControllerForPagination;
  final bool showCheckboxColumn;
  final double? horizontalMargin;
  final double? columnSpacing;
  final void Function(bool?)? onSelectAll;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollControllerForPagination
          ?..addListener(
            () {
              if (_doLoadMore()) {
                onLoadMore?.call();
              }
            },
          ),
        child: Column(
          children: [
            DataTable(
              columns: columns,
              rows: isLoading
                  ? List.generate(
                      rows.length + 1,
                      (index) {
                        if (index == rows.length) {
                          return loadingRow??DataRow(
                            cells: <DataCell>[
                              AppDataTableCell(
                                customCellBody: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [ShimmerWidget.circular(width: 20, height: 20), SizedBox(width: 8), Expanded(child: ShimmerWidget.rectangular(height: 20))],
                                ),
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                              AppDataTableCell(
                                customCellBody: ShimmerWidget.rectangular(height: 20),
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              AppDataTableCell(
                                customCellBody: ShimmerWidget.rectangular(height: 20),
                                alignment: Alignment.center,
                              ),
                              AppDataTableCell(
                                customCellBody: ShimmerWidget.rectangular(height: 20),
                                alignment: Alignment.center,
                              ),
                              AppDataTableCell(
                                width: MediaQuery.of(context).size.width * 0.1,
                                customCellBody: ShimmerWidget.rectangular(height: 20),

                                alignment: Alignment.center,
                              ),
                              AppDataTableCell(
                                width: MediaQuery.of(context).size.width * 0.1,
                                customCellBody: ShimmerWidget.rectangular(height: 20),
                                alignment: Alignment.center,
                              ),
                              AppDataTableCell(
                                width: MediaQuery.of(context).size.width * 0.1,
                                customCellBody: ShimmerWidget.rectangular(height: 20,width: 20),
                                alignment: Alignment.center,
                              ),
                              AppDataTableCell(
                                width: MediaQuery.of(context).size.width * 0.1,
                                customCellBody: ShimmerWidget.rectangular(height: 20,width: 20),
                                alignment: Alignment.center,
                              ),
                            ],
                          );
                        }
                        return rows[index];
                      },
                    )
                  : rows,
              showCheckboxColumn: showCheckboxColumn,
              onSelectAll: onSelectAll,
              dividerThickness: 2,
              columnSpacing: columnSpacing ?? 8,
              horizontalMargin: horizontalMargin ?? 8,
              border: TableBorder.all(color: Colors.grey.shade300),
              headingRowColor: WidgetStateProperty.all(AppColors.primaryMain),
              headingRowHeight: 50,
              headingTextStyle: AppStyles.textStyle.copyWith(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _doLoadMore() {
    if (scrollControllerForPagination != null) {
      bool isScrolling = scrollControllerForPagination!.offset >= scrollControllerForPagination!.position.maxScrollExtent - 50;
      return isScrolling && !isLoading && !hasReachedEnd;
    }
    return false;
  }
}
