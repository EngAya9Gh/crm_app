import 'package:flutter/material.dart';

import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/transfer_client_page.dart';
import 'custom_ticket_details_action_button.dart';

class TransferTicketButton extends StatelessWidget {
  const TransferTicketButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return CustomTicketDetailsActionButton(
      onPressed: () {
        AppNavigator.push(TransferClientPage(
          nameEnterprise: ticketModel.nameEnterprise.toString(),
          idClient: ticketModel.fkClient.toString(),
          idTicket: ticketModel.idTicket,
          type: "ticket",
        ));
      },
      text: 'تحويل التذكرة',
    );
  }
}
