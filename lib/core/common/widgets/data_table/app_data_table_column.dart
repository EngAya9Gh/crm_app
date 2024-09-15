import 'package:flutter/material.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';

DataColumn AppDataTableColumn(String label) {
  return DataColumn(
    label: Flexible(
      child: AppText(
        label,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
