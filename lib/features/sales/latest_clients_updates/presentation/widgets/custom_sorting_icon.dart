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
      message: "فلترة",
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10).r,
        child: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Icon(Icons.sort_by_alpha,
              color: Colors.grey.shade600, size: 30.r),
        ),
      ),
    );
  }
}
