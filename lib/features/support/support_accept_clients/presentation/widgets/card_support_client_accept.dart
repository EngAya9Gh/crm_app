import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardSupportClientAccept extends StatelessWidget {
  const CardSupportClientAccept({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.push(ClientProfile(idClient: client.idClients));
      },
      child: AppText(client.nameEnterprise),
    );
  }
}
