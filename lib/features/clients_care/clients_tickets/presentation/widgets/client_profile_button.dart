import 'package:flutter/material.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/profile_client.dart';
import '../../data/models/ticket_model.dart';
import 'custom_ticket_details_action_button.dart';

class ClientProfileButton extends StatefulWidget {
  const ClientProfileButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  State<ClientProfileButton> createState() => _ClientProfileButtonState();
}

class _ClientProfileButtonState extends State<ClientProfileButton> {
  late final bool isExpanded;

  @override
  void initState() {
    final ticketType =
        TicketTypeExtension.getTicketType(widget.ticketModel.typeTicket);
    isExpanded = ticketType == TicketTypesEnum.rate;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTicketDetailsActionButton(
      isExpanded: isExpanded,
      onPressed: () {
        AppNavigator.push(ProfileClient(
          idClient: widget.ticketModel.fkClient,
        ));
      },
      text: 'ملف العميل',
    );
  }
}
