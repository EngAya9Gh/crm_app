import 'package:crm_smart/core/common/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';

class FancyImageShimmerViewer extends StatelessWidget {
  const FancyImageShimmerViewer({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  final String imageUrl;
  final Widget? errorWidget;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: errorWidget,
      // boxFit: fit,
      height: height ?? 300,
      width: width ?? 300,
    );
  }
}
