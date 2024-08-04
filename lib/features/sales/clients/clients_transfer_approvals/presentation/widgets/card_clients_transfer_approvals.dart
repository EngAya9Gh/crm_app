import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../ui/screen/client/profileclient.dart';
import '../../../../../app/presentation/widgets/app_text.dart';

class CardClientsTransferApprovals extends StatelessWidget {
  const CardClientsTransferApprovals({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(ProfileClient(
          clientTransfer: 'transfer',
          idClient: client.idClients,
        ));
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    client.nameusertransfer.toString(),
                    style: context.textTheme.titleSmall?.copyWith(
                      color: kMainColor,
                    ),
                  ),
                  AppText(
                    client.dateTransfer.toString(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
              Text(
                client.nameEnterprise.toString(),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
