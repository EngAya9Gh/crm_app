import 'package:crm_smart/core/common/extensions/num_extensions.dart';
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // receive ticket button
              if (isAllowedToReceive(currentTicketType, context)) ...[
                Expanded(child: ReceiveTicketButton(ticketModel: ticketModel)),
                5.width,
              ],
              // transfer ticket button
              if (_isAllowedToTransfer(currentTicketType, context)) ...[
                Expanded(child: TransferTicketButton(ticketModel: ticketModel)),
                5.width,
              ],
              // close ticket button
              if (_isAllowedToClose(currentTicketType, context)) ...[
                Expanded(child: CloseTicketButton(ticketModel: ticketModel)),
                5.width,
              ],
              // reopen ticket button
              if (currentTicketType == TicketTypesEnum.close) ...[
                Expanded(child: ReopenTicketButton(ticketModel: ticketModel)),
                5.width,
                Expanded(child: RateAfterClosingButton(ticketModel: ticketModel)),
                5.width,
              ],

              // rate ticket button
            ],
          ),
          10.vertical,
          Row(
            children: [
              // client file button
              if (ticketModel.fkClient != null &&
                  ticketModel.fkClient != "null") ...[
                Expanded(child: ClientProfileButton(ticketModel: ticketModel)),
                5.width,
              ],
            ],
          )
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
    return (currentTicketType == TicketTypesEnum.receive || currentTicketType==TicketTypesEnum.open) &&
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
