import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../model/lastCommentClientModel.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';

class CardLatestClientsUpdates extends StatelessWidget {
  const CardLatestClientsUpdates({
    super.key,
    required this.latestUpdate,
  });

  final LastCommentClientModel latestUpdate;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          ClientProfile(
            tabIndex: 2,
            client: latestUpdate.clientObject,
            idClient: latestUpdate.clientObject.idClients,
          ),
          name: AppRoutesNames.clientProfile.inLatestClientsUpdates,
        );
      },
      child: Flex(
        direction: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      latestUpdate.clientObject.nameRegion.toString(),
                      style: _buildTextStyle(context),
                      fontSize: 18,
                    ),
                    AppText(
                      latestUpdate.clientObject.nameEnterprise ??
                          latestUpdate.clientObject.nameClient!,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      (_daysText()),
                      style: _buildTextStyle(context),
                    ),
                    AppText(
                      'مضى على آخر تعليق',
                      style: _buildTextStyle(context),
                    ),
                    // if (isMarketing) ...[
                    if (true) ...[
                      AppText(
                        'عمر التفاوض ${latestUpdate.ageClient}',
                        style: _buildTextStyle(context),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _daysText() {
    return int.parse(latestUpdate.hoursLastComment.toString()) < 0
        ? 'لا يوجد اي تعليق'
        : latestUpdate.hoursLastComment.toString() + ' يوم ';
  }

  TextStyle? _buildTextStyle(BuildContext context) {
    return AppStyles.textStyle.copyWith(
      color: AppColors.primaryColor,
      fontSize: 16,
    );
  }
}
