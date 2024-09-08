import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import 'app_icon.dart';

class CustomFilterIcon extends StatelessWidget {
  const CustomFilterIcon({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "فلترة",
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50.scaleIconsSize,
          width: 50.scaleIconsSize,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AppIcon(
            Icons.filter_alt_rounded,
            color: Colors.grey.shade600,
            size: (35.0).scaleIconsSize,
          ),
        ),
      ),
    );
  }
}
