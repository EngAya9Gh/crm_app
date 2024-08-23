import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../core/config/app_dynamic_links.dart';
import '../../../../model/notificationModel.dart';
import '../../../app/presentation/widgets/app_text.dart';

class CardNotifications extends StatelessWidget {
  const CardNotifications({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: notification.isread == 0 ? Colors.black12 : AppColors.white,
      onTap: () => AppDynamicLinks.routeNotifyTo(
        notification.typeNotify,
        context,
        null,
        notification.data,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: AppText(notification.message, fontSize: 18)),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              notification.dateNotify,
              color: AppColors.primaryColor,
              fontSize: 16,
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}
