import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/lastCommentClientModel.dart';
import '../../../../../../ui/screen/client/profileclient.dart';
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
        AppNavigator.push(ProfileClient(
          tabIndex: 2,
          client: latestUpdate.clientObject,
          idClient: latestUpdate.clientObject.idClients,
        ));
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
      color: kMainColor,
      fontSize: 16,
    );
  }
}
