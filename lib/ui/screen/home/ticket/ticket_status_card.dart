import 'package:crm_smart/features/clients_care/clients_tickets/presentation/pages/ticket_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../features/clients_care/clients_tickets/data/models/ticket_model.dart';

class TicketStatusCard extends StatelessWidget {
  const TicketStatusCard({required this.ticketModel, Key? key})
      : super(key: key);
  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.2),
          ),
        ],
        color: Colors.white30,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => TicketDetailsPage(
                          type: '1',
                          ticketModel: ticketModel,
                        ) // support_view(type: 'only',)
                    ));
          },
          child: Container(
            decoration: BoxDecoration(color: kWhiteColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#' + ticketModel.idTicket,
                        style: TextStyle(
                            color: kMainColor, fontFamily: kfontfamily2),
                      ),
                      Text(
                        ticketModel.typeTicket.toString(),
                        style: TextStyle(
                            color: kMainColor, fontFamily: kfontfamily2),
                      ),
                      Text(
                        'تاريخ فتح التذكرة  ' + ticketModel.dateOpen.toString(),
                        style: TextStyle(
                            color: kMainColor, fontFamily: kfontfamily2),
                      ),
                    ],
                  ),
                  Text(
                    ticketModel.dateClose == null
                        ? ticketModel.detailsProblem.toString()
                        : ticketModel.notesTicket.toString(),
                    style: TextStyle(
                      fontFamily: kfontfamily2,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
