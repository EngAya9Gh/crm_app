import 'package:crm_smart/features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/widgets/close_ticket_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../../ui/screen/client/transfer_client.dart';
import '../../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../data/models/ticket_model.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../pages/ticket_rate_page.dart';
import 'recieve_ticket_button.dart';

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
          AppConstants.showSnakeBar(context, 'تم استلام التذكرة بنجاح');
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // opened ticket
          if (currentTicketType == TicketTypesEnum.open &&
              context.read<PrivilegeCubit>().checkPrivilege('71')) ...[
            ReceiveTicketButton(ticketModel: ticketModel),
          ],
          // closed ticket
          if (currentTicketType != TicketTypesEnum.close &&
              currentTicketType != TicketTypesEnum.rate &&
              context.read<PrivilegeCubit>().checkPrivilege('72')) ...[
            CloseTicketButton(ticketModel: ticketModel),
          ],
          // received ticket
          if (currentTicketType == TicketTypesEnum.receive &&
              context.read<PrivilegeCubit>().checkPrivilege('75')) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kMainColor)),
                  onPressed: () {
                    AppNavigator.push(transferClient(
                      name_enterprise: ticketModel.nameEnterprise.toString(),
                      idclient: ticketModel.fkClient.toString(),
                      idticket: ticketModel.idTicket,
                      type: "ticket",
                    ));
                  },
                  child: Text('تحويل\nالتذكرة'),
                ),
              ),
            )
          ],
          SizedBox(width: 5),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kMainColor)),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProfileClient(
                              idClient: ticketModel.fkClient,
                            )));
              },
              child: Text(currentTicketType == TicketTypesEnum.close ||
                      currentTicketType == TicketTypesEnum.rate
                  ? 'ملف العميل'
                  : 'ملف\nالعميل'),
            ),
          ),
          SizedBox(width: 5),
          if (currentTicketType == TicketTypesEnum.close) ...[
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kMainColor)),
                onPressed: () {
                  AppNavigator.push(TicketRatePage(ticket_model: ticketModel));
                },
                child: Text('تقييم بعد الإغلاق'),
              ),
            )
          ],
        ],
      ),
    );
  }
}
