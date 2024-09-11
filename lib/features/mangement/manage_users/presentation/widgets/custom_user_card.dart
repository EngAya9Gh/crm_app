import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../model/usermodel.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../pages/user_profile.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => AppNavigator.go(
        UserProfile(
          userModel: user,
          id: user.idUser!,
        ),
        pathParameters: {'id': user.idUser!},
        extra: {'userModel': user},
        name: AppRoutesNames.userProfile.inUsersList,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.scaleIconsSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: AppCachedNetworkImage(
                width: 500.scaleIconsSize,
                height: 500.scaleIconsSize,
                fit: BoxFit.fill,
                imageUrl: user.img_image,
              ),
            ),
          ),
          10.width,
          Flexible(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(user.nameUser),
                  8.height,
                  AppText(user.name_mange),
                ],
              ),
            ),
          ),
          20.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  AppText(user.isActive == '1' ? 'Active' : 'Inactive'),
                  5.width,
                  CircleAvatar(
                    radius: 6.scaleIconsSize,
                    backgroundColor:
                        user.isActive == '1' ? Colors.green : Colors.red,
                  ),
                ],
              ),
              if (user.fkRegoin != null) ...{
                8.height,
                AppText(
                  user.nameRegoin,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              },
            ],
          ),
        ],
      ),
    );
  }
}
