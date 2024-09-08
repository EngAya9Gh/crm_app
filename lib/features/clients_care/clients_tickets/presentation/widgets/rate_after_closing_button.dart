import 'package:flutter/material.dart';

import '../../../../../core/config/navigator/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/ticket_rate_page.dart';
import 'custom_ticket_details_action_button.dart';

class RateAfterClosingButton extends StatelessWidget {
  const RateAfterClosingButton({
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
      text: 'تقييم بعد الإغلاق',
    );
  }
}
