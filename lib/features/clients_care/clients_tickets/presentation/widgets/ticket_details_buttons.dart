import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
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
    super.key,
    required this.ticketModel,
  });

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    final currentTicketType =
        TicketTypeExtension.getTicketType(ticketModel.typeTicket);
    return BlocListener<EditTicketCubit, EditTicketState>(
      listener: (context, state) {
        if (state is EditTicketError) {
          AppSnackbar.showSnakeBar(
            state.message,
            color: ToastColorsEnum.error,
          );
        } else if (state is EditTicketSuccess) {
          AppNavigator.pop();
          context.read<TicketsCubit>().getTickets();
          AppSnackbar.showSnakeBar(
            'تمت العملية بنجاح',
            color: ToastColorsEnum.success,
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // receive ticket button
          if (isAllowedToReceive(currentTicketType, context)) ...[
            ReceiveTicketButton(ticketModel: ticketModel),
            SizedBox(width: 2),
          ],
          // transfer ticket button
          if (_isAllowedToTransfer(currentTicketType, context)) ...[
            TransferTicketButton(ticketModel: ticketModel),
            SizedBox(width: 2),
          ],
          // close ticket button
          if (_isAllowedToClose(currentTicketType, context)) ...[
            CloseTicketButton(ticketModel: ticketModel),
            SizedBox(width: 2),
          ],
          // reopen ticket button
          if (currentTicketType == TicketTypesEnum.close) ...[
            ReopenTicketButton(ticketModel: ticketModel),
            SizedBox(width: 2),
            RateAfterClosingButton(ticketModel: ticketModel),
            SizedBox(width: 2),
          ],
          // client file button
          if (ticketModel.fkClient != null &&
              ticketModel.fkClient != "null") ...[
            ClientProfileButton(ticketModel: ticketModel),
            SizedBox(width: 2),
          ],
          // rate ticket button
        ],
      ),
    );
  }

  bool isAllowedToReceive(
      TicketTypesEnum currentTicketType, BuildContext context) {
    return _isNewTicket(currentTicketType) &&
        context.read<PrivilegesCubit>().checkPrivilege('71');
  }

  bool _isAllowedToTransfer(
      TicketTypesEnum currentTicketType, BuildContext context) {
    return currentTicketType == TicketTypesEnum.receive &&
        context.read<PrivilegesCubit>().checkPrivilege('75');
  }

  bool _isAllowedToClose(
      TicketTypesEnum currentTicketType, BuildContext context) {
    return currentTicketType != TicketTypesEnum.close &&
        currentTicketType != TicketTypesEnum.rate &&
        context.read<PrivilegesCubit>().checkPrivilege('72');
  }

  bool _isNewTicket(TicketTypesEnum type) =>
      (type == TicketTypesEnum.open || type == TicketTypesEnum.reopen);
}
