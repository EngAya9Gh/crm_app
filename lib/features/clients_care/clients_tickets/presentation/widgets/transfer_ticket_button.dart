import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/navigator/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/transfer_client_page.dart';

class TransferTicketButton extends StatelessWidget {
  const TransferTicketButton({
    super.key,
    required this.ticketModel,
  });

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: 'تحويل التذكرة',
      onPressed: () {
        AppNavigator.go(
          TransferClientPage(
            nameEnterprise: ticketModel.nameEnterprise.toString(),
            idClient: ticketModel.fkClient.toString(),
            idTicket: ticketModel.idTicket,
            type: "ticket",
          ),
          isNew: false,
        );
      },
    );
  }
}
