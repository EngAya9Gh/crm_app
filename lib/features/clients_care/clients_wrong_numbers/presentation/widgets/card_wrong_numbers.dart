import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardWrongNumbers extends StatelessWidget {
  const CardWrongNumbers({
    super.key,
    required this.communication,
    required this.tabCareIndex,
  });

  final CommunicationModel communication;
  final int tabCareIndex;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(ClientProfile(
          idClient: communication.fkClient,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        communication.name_regoin,
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        HelperFunctions.formatDate(
                          communication.dateCommunication,
                        ),
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppText(communication.nameEnterprise),
          ],
        ),
      ),
    );
  }
}
