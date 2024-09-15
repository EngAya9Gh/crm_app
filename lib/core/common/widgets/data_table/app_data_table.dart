import 'package:flutter/material.dart';

DataTable AppDataTable({
  required List<DataColumn> columns,
  required List<DataRow> rows,
}) {
  return DataTable(
    dividerThickness: 2,
    horizontalMargin: 3,
    columnSpacing: 5,
    columns: columns,
    rows: rows,
  );
}
