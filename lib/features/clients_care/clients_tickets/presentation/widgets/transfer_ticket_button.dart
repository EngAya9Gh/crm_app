import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../pages/transfer_client_page.dart';

class TransferTicketButton extends StatelessWidget {
  const TransferTicketButton({
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
          AppNavigator.push(TransferClientPage(
            nameEnterprise: ticketModel.nameEnterprise.toString(),
            idClient: ticketModel.fkClient.toString(),
            idTicket: ticketModel.idTicket,
            type: "ticket",
          ));
        },
        child: Text('تحويل\nالتذكرة'),
      ),
    );
  }
}
