import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../data/models/ticket_model.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import 'client_profile_button.dart';
import 'close_ticket_button.dart';
import 'rate_after_closing_button.dart';
import 'receive_ticket_button.dart';
import 'reopen_ticket_button.dart';
import 'transfer_ticket_button.dart';

class TicketDetailsButtons extends StatelessWidget {
  const TicketDetailsButtons({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    final currentTicketType =
        TicketTypeExtension.getTicketType(ticketModel.typeTicket);
    return BlocListener<EditTicketCubit, EditTicketState>(
      listener: (context, state) {
        if (state is EditTicketError) {
          AppConstants.showSnakeBar(context, state.message);
        } else if (state is EditTicketSuccess) {
          AppNavigator.pop();
          context.read<TicketsCubit>().getTickets();
          AppConstants.showSnakeBar(context, 'تمت العملية بنجاح');
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // receive ticket button
          if (isAllowedToReceive(currentTicketType, context)) ...[
            ReceiveTicketButton(ticketModel: ticketModel),
            SizedBox(width: 5),
          ],
          // close ticket button
          if (_isAllowedToClose(currentTicketType, context)) ...[
            CloseTicketButton(ticketModel: ticketModel),
            SizedBox(width: 5),
          ],
          // transfer ticket button
          if (_isAllowedToTransfer(currentTicketType, context)) ...[
            TransferTicketButton(ticketModel: ticketModel),
            SizedBox(width: 5),
          ],
          // reopen ticket button
          if (currentTicketType == TicketTypesEnum.close) ...[
            ReopenTicketButton(ticketModel: ticketModel),
            SizedBox(width: 5),
          ],
          // client file button
          ClientProfileButton(ticketModel: ticketModel),
          SizedBox(width: 5),
          // rate ticket button
          if (currentTicketType == TicketTypesEnum.close) ...[
            RateAfterClosingButton(ticketModel: ticketModel),
            SizedBox(width: 5),
          ],
        ],
      ),
    );
  }

  bool isAllowedToReceive(
      TicketTypesEnum currentTicketType, BuildContext context) {
    return _isNewTicket(currentTicketType) &&
        context.read<PrivilegeCubit>().checkPrivilege('71');
  }

  bool _isAllowedToTransfer(
      TicketTypesEnum currentTicketType, BuildContext context) {
    return currentTicketType == TicketTypesEnum.receive &&
        context.read<PrivilegeCubit>().checkPrivilege('75');
  }

  bool _isAllowedToClose(
      TicketTypesEnum currentTicketType, BuildContext context) {
    return currentTicketType != TicketTypesEnum.close &&
        currentTicketType != TicketTypesEnum.rate &&
        context.read<PrivilegeCubit>().checkPrivilege('72');
  }

  bool _isNewTicket(TicketTypesEnum type) =>
      (type == TicketTypesEnum.open || type == TicketTypesEnum.reopen);
}
