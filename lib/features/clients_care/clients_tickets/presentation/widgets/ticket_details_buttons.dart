import 'package:crm_smart/features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/widgets/close_ticket_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../../ui/screen/client/transfer_client.dart';
import '../../../../../ui/screen/home/ticket/ticket_rate.dart';
import '../../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../data/models/ticket_model.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import 'recieve_ticket_button.dart';

class TicketDetailsButtons extends StatelessWidget {
  const TicketDetailsButtons({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
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
          if (ticketModel.dateRecive == null &&
              context.read<PrivilegeCubit>().checkPrivilege('71')) ...[
            ReceiveTicketButton(ticketModel: ticketModel),
          ],
          if (ticketModel.dateClose == null &&
              context.read<PrivilegeCubit>().checkPrivilege('72')) ...[
            CloseTicketButton(ticketModel: ticketModel),
          ],
          if (ticketModel.dateRecive != null &&
              ticketModel.dateClose == null &&
              context.read<PrivilegeCubit>().checkPrivilege('75')) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kMainColor)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => transferClient(
                                  name_enterprise:
                                      ticketModel.nameEnterprise.toString(),
                                  idclient: ticketModel.fkClient.toString(),
                                  idticket: ticketModel.idTicket,
                                  type: "ticket",
                                ),
                            fullscreenDialog: true));
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
              child: Text('ملف\nالعميل'),
            ),
          ),
          SizedBox(width: 5),
          if (ticketModel.dateClose != null &&
              ticketModel.dateRate == null) ...[
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kMainColor)),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ticket_rate(
                                ticket_model: ticketModel,
                              )));
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
