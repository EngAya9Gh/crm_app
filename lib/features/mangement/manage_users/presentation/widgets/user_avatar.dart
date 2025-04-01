import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/app_cached_network_image.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 20, bottom: 5),
      child: CircleAvatar(
        radius: 70.scaleIconsSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: AppCachedNetworkImage(
            width: 500.scaleIconsSize,
            height: 500.scaleIconsSize,
            fit: BoxFit.fill,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
