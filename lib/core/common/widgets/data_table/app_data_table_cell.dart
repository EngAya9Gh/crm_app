import 'package:flutter/material.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';

DataCell AppDataTableCell(
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
          fontSize: 18,
        ),
      ),
    ),
  );
}
