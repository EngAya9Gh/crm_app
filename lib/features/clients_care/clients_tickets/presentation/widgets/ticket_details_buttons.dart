import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../../ui/screen/client/transfer_client.dart';
import '../../../../../ui/screen/home/ticket/ticket_rate.dart';
import '../../../../../view_model/ticket_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../data/models/ticket_model.dart';
import 'ticket_close_dialog.dart';

class TicketDetailsButtons extends StatelessWidget {
  const TicketDetailsButtons({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (ticketModel.dateRecive == null &&
            context.read<PrivilegeCubit>().checkPrivilege('71')) ...[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kMainColor)),
                  onPressed: () async {
                    Provider.of<ticket_vm>(context, listen: false)
                        .updateTicketvm({
                      'fk_user_recive':
                          Provider.of<UserProvider>(context, listen: false)
                              .currentUser
                              .idUser,
                      'date_recive': DateTime.now(),
                      'type_ticket': 'قيد التنفيذ'
                    }, ticketModel.idTicket);
                    Navigator.pop(context);
                  },
                  child: Text('استلام\nالتذكرة')),
            ),
          )
        ],
        if (ticketModel.dateClose == null &&
            context.read<PrivilegeCubit>().checkPrivilege('72')) ...[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kMainColor)),
                onPressed: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => TicketCloseDialog(
                            ticketModel: ticketModel,
                          ));
                },
                child: Text('اغلاق\nالتذكرة')),
          ),
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
        if (ticketModel.dateClose != null && ticketModel.dateRate == null) ...[
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
    );
  }
}
