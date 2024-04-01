import 'package:flutter/material.dart';

import '../../data/models/ticket_model.dart';
import 'custom_ticket_details_action_button.dart';
import 'ticket_close_dialog.dart';

class CloseTicketButton extends StatelessWidget {
  const CloseTicketButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return CustomTicketDetailsActionButton(
      onPressed: () async {
        await showDialog<void>(
            context: context,
            builder: (context) {
              return TicketCloseDialog(
                ticketModel: ticketModel,
              );
            });
      },
      text: 'اغلاق التذكرة',
    );
  }
}
