import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_dimensions.dart';

class CustomResetIcon extends StatelessWidget {
  const CustomResetIcon({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return SizedBox.shrink();
    return Tooltip(
      message: "إعادة الافتراضي",
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10).r,
        child: Container(
          height: AppDimensions.scaleWidth(50),
          width: AppDimensions.scaleWidth(50),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Icon(
            Icons.restore,
            color: Colors.grey.shade600,
            size: (35.0).scaleIconsSize,
          ),
        ),
      ),
    );
  }
}
