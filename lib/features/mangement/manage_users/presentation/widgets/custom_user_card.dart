import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
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
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey[200]!,
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: () => AppNavigator.go(
          UserProfile(
            userModel: user,
            id: user.idUser!,
          ),
          pathParameters: {'id': user.idUser!},
          extra: {'userModel': user},
          name: AppRoutesNames.userProfile.inUsersList,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المستخدم
              CircleAvatar(
                radius: 30.scaleIconsSize,
                backgroundColor: Colors.grey[200],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: AppCachedNetworkImage(
                    width: 500.scaleIconsSize,
                    height: 500.scaleIconsSize,
                    fit: BoxFit.fill,
                    imageUrl: user.img_image,
                    // errorWidget: (context, url, error) => const Icon(
                    //   Icons.person,
                    //   size: 30,
                    //   color: Colors.grey,
                    // ),
                  ),
                ),
              ),
              10.width,
              // معلومات المستخدم
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      user.nameUser,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    8.height,
                    AppText(
                      user.name_mange,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              16.width,
              // الفرع وحالة النشاط
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (user.fkRegoin != null) ...[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryMain,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primaryMain,
                          width: 1,
                        ),
                      ),
                      child: AppText(
                        user.nameRegoin,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    12.height,
                  ],
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        user.isActive == '1' ? 'نشط' : 'غير نشط',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              user.isActive == '1' ? Colors.green : Colors.red,
                        ),
                      ),
                      8.width,
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              user.isActive == '1' ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
