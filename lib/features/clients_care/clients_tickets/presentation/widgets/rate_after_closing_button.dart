import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/ticket_rate_page.dart';

class RateAfterClosingButton extends StatelessWidget {
  const RateAfterClosingButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
        onPressed: () {
          AppNavigator.push(TicketRatePage(ticket_model: ticketModel));
        },
        child: Text('تقييم بعد الإغلاق'),
      ),
    );
  }
}
