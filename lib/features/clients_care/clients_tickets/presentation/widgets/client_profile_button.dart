import 'package:flutter/material.dart';

import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/ticket_rate_page.dart';
import 'custom_ticket_details_action_button.dart';

class ClientProfileButton extends StatelessWidget {
  const ClientProfileButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return CustomTicketDetailsActionButton(
      onPressed: () {
        AppNavigator.push(TicketRatePage(ticket_model: ticketModel));
      },
      text: 'ملف العميل',
    );
  }
}
