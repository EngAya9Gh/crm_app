import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        borderRadius: BorderRadius.circular(10).r,
        child: Container(
          height: AppDimensions.scaleWidth(50),
          width: AppDimensions.scaleWidth(50),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Icon(
            Icons.filter_alt_rounded,
            color: Colors.grey.shade600,
            size: (35.0).scaleIconsSize,
          ),
        ),
      ),
    );
  }
}
