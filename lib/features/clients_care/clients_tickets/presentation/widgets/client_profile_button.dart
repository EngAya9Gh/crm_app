import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/ticket_rate_page.dart';

class ClientProfileButton extends StatelessWidget {
  const ClientProfileButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    final currentTicketType =
        TicketTypeExtension.getTicketType(ticketModel.typeTicket);
    return Expanded(
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
        onPressed: () {
          AppNavigator.push(TicketRatePage(ticket_model: ticketModel));
        },
        child: Text(currentTicketType == TicketTypesEnum.close ||
                currentTicketType == TicketTypesEnum.rate
            ? 'ملف العميل'
            : 'ملف\nالعميل'),
      ),
    );
  }
}
