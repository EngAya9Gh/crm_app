import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class AppAssetImage extends StatelessWidget {
  const AppAssetImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
  });

  final String imagePath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.scaleIconsSize,
      width: width?.scaleIconsSize,
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
