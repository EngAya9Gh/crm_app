import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImageView extends StatelessWidget {
  final String url;
  final Function()? function;
  final BoxFit? boxFit;
  final Widget? errorWidget;
  final Widget? placeHolder;
  final double? width;
  final double? height;

  const AppCachedNetworkImageView({
    Key? key,
    required this.url,
    this.function,
    this.boxFit,
    this.errorWidget,
    this.width,
    this.height,
    this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: boxFit ?? BoxFit.cover,
        width: width?.scaleWidth,
        height: height?.scaleHeight,
        placeholder: (context, imageUrl) {
          return Center(
            child: placeHolder,
          );
        },
        errorWidget: (context, imageUrl, error) {
          return errorWidget ?? const SizedBox.shrink();
        },
      ),
    );
  }
}
