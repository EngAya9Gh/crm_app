import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../data/models/ticket_model.dart';
import 'ticket_close_dialog.dart';

class CloseTicketButton extends StatelessWidget {
  const CloseTicketButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kMainColor)),
          onPressed: () async {
            await showDialog<void>(
                context: context,
                builder: (context) {
                  return TicketCloseDialog(
                    ticketModel: ticketModel,
                  );
                });
          },
          child: Text('اغلاق\nالتذكرة')),
    );
  }
}
