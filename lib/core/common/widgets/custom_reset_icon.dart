import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_dimensions.dart';

class CustomResetIcon extends StatelessWidget {
  const CustomResetIcon({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    print("onTap: $onTap");
    if (onTap == null) return SizedBox.shrink();
    return Tooltip(
      message: "إعادة الافتراضي",
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10).r,
        child: Container(
          height: AppDimensions.scaleWidth(50),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AppText(
                'reset',
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ),
      ),

      // InkWell(
      //   onTap: onTap,
      //   borderRadius: BorderRadius.circular(10).r,
      //   child: Container(
      //     height: AppDimensions.scaleWidth(50),
      //     width: AppDimensions.scaleWidth(50),
      //     decoration: BoxDecoration(
      //       color: Colors.grey.shade200,
      //       borderRadius: BorderRadius.circular(10).r,
      //     ),
      //     child: Icon(
      //       Icons.restore,
      //       color: Colors.grey.shade600,
      //       size: (35.0).scaleIconsSize,
      //     ),
      //   ),
      // ),
    );
  }
}
