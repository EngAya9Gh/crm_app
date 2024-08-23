import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../widgets/custom_widget/card_expansion.dart';
import 'ticketview.dart';

class TicketAll extends StatelessWidget {
  const TicketAll({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketsCubit = context.watch<TicketsCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView.separated(
          itemCount: ticketsCubit.clientTicketsList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Builder(builder: (context) {
              return buildcardExpansion(
                  'تاريخ فتح التذكرة ${ticketsCubit.clientTicketsList[index].dateOpen}',
                  ticketsCubit.clientTicketsList[index].nameEnterprise,
                  TicketView(
                    type: '1',
                    ticketModel: ticketsCubit.clientTicketsList[index],
                  ));
            });
          },
        ),
      ),
    );
  }
}
