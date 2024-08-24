import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/extensions/build_context.dart';
import '../../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/usermodel.dart';
import '../pages/user_profile.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(UserProfile(userModel: user)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: AppCachedNetworkImage(
                    width: 500,
                    height: 500,
                    fit: BoxFit.fill,
                    imageUrl: user.img_image,
                  ),
                ),
              ),
              25.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.nameUser ?? '',
                      style: context.textTheme.labelLarge),
                  8.verticalSpace,
                  Text(user.name_mange ?? '',
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 6.r,
                      backgroundColor:
                          user.isActive == '1' ? Colors.green : Colors.red),
                  5.horizontalSpace,
                  Text(user.isActive == '1' ? 'Active' : 'UnActive',
                      style: context.textTheme.labelLarge),
                ],
              ),
              if (user.fkRegoin != null) ...{
                8.verticalSpace,
                Text(user.nameRegoin.toString(),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    )),
              },
            ],
          ),
        ],
      ),
    );
  }
}
