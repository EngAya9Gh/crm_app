import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';

DataCell AppDataTableCell({
  String? value,
  double? width,
  Widget? icon,
  Alignment? alignment,
  Widget? customCellBody,
}) {
  return DataCell(
    Align(
      alignment: alignment ?? Alignment.centerRight,
      child: SizedBox(
        width: width,
        child: customCellBody ?? _Body(icon: icon, value: value),
      ),
    ),
  );
}

class _Body extends StatelessWidget {
  const _Body({super.key, this.value, this.icon});

  final String? value;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    if (icon != null && value != null) {
      return Row(
        children: [
          icon!,
          5.width,
          AppText(
            value,
            fontSize: 18,
          ),
        ],
      );
    }

    if (value != null) {
      return AppText(
        value,
        fontSize: 18,
      );
    }

    if (icon != null) {
      return icon!;
    }

    throw Exception('icon and value are null');
  }
}
