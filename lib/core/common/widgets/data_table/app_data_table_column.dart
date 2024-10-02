import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';

DataColumn AppDataTableColumn(
  String label, {
  Color? color,
  bool isCentred = false,
  double? width,
}) {
  Widget child = Flexible(
    child: Align(
      alignment: Alignment.centerRight,
      child: AppText(
        label,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
        color: color ?? AppColors.white,
      ),
    ),
  );

  return DataColumn(
    label: isCentred ? Center(child: child) : child,
  );
}
