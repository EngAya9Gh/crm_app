import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

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
    return AppElevatedButton(
      text: 'اغلاق التذكرة',
      onPressed: () async {
        AppConstants.showAppDialog(
          child: TicketCloseDialog(
            ticketModel: ticketModel,
          ),
        );
      },
    );
  }
}
