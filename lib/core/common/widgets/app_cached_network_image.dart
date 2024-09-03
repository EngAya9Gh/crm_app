import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final Function()? function;
  final BoxFit? fit;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.function,
    this.fit,
    this.errorWidget,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CachedNetworkImage(
        errorListener: (value) {
          debugPrint(
              'Error in AppCachedNetworkImage => $value | url is => $imageUrl');
        },
        imageUrl: imageUrl ?? '',
        fit: fit ?? BoxFit.cover,
        width: width?.scaleWidth,
        height: height?.scaleHeight,
        progressIndicatorBuilder: (context, imageUrl, downloadProgress) {
          return AppLoader();
        },
        errorWidget: (context, imageUrl, error) {
          return Center(
            child: errorWidget ??
                Icon(
                  Icons.person,
                  size: 50.scaleIconsSize,
                  color: AppColors.secondaryColor,
                ),
            // AppText(
            //   _firstCharacter(),
            //   color: AppColors.secondaryColor,
            //   fontSize: 25,
            // ),
          );
        },
      ),
    );
  }

  String _firstCharacter() {
    return AppConstants.currentUser.nameUser.toString().substring(0, 1);
  }
}
