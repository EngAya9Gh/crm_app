import 'package:flutter/material.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';

class CardClientsTransferApprovals extends StatelessWidget {
  const CardClientsTransferApprovals({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.push(ClientProfile(
          clientTransfer: 'transfer',
          idClient: client.idClients,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                client.nameusertransfer.toString(),
                color: AppColors.primaryColor,
              ),
              AppText(
                client.dateTransfer.toString(),
                color: AppColors.primaryColor,
              ),
            ],
          ),
          AppText(client.nameEnterprise.toString(), fontSize: 14),
        ],
      ),
    );
  }
}
