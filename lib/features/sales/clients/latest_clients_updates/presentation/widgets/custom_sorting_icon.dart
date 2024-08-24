import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSortingIcon extends StatelessWidget {
  const CustomSortingIcon({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "ترتيب",
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10).r,
        child: Container(
          height: (50.0).scaleHeight,
          width: (50.0).scaleWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Icon(
            Icons.sort_by_alpha,
            color: Colors.grey.shade600,
            size: (35.0).scaleIconsSize,
          ),
        ),
      ),
    );
  }
}
