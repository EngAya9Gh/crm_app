import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.width, required this.height, required this.shapeBorder});

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)));

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      //this is background color
      baseColor: Colors.grey[200]!,
      //this is foreground color
      highlightColor: Colors.grey[300]!,
      // the duration that loading animation take
      period: const Duration(seconds: 2),
      direction: ShimmerDirection.rtl,
      child: Container(
        width: width,
        height: height,
        // shape of loading
        decoration: ShapeDecoration(
          color: AppColors.grey,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
