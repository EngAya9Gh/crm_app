import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppDataTable extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.showCheckboxColumn = false,
    this.onSelectAll,
  });

  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool showCheckboxColumn;
  final void Function(bool?)? onSelectAll;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: SizedBox(
          width: kIsWeb?MediaQuery.sizeOf(context).width * 0.75:MediaQuery.sizeOf(context).width * 0.95, // Increased width
          child: DataTable(
            columns: columns,
            rows: rows,
            showCheckboxColumn: showCheckboxColumn,
            onSelectAll: onSelectAll,
            dividerThickness: 2,
            columnSpacing: 20,
            horizontalMargin: 10,
            border: TableBorder.all(color: Colors.grey.shade300),
            headingRowColor: WidgetStateProperty.all(AppColors.primaryMain),
            headingRowHeight: 50,
            headingTextStyle: AppStyles.textStyle.copyWith(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
