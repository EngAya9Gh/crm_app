import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/ticket_card.dart';

class TicketsList extends StatelessWidget {
  const TicketsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticketsCubit = context.read<TicketsCubit>();
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) {
        return current is GetTicketsLoaded ||
            current is GetTicketsError ||
            current is GetTicketsLoading ||
            current is TicketsFiltered;
      },
      builder: (context, state) {
        if (state is GetTicketsLoading) {
          return CustomLoadingIndicator();
        } else if (state is GetTicketsError) {
          return CustomErrorWidget(onPressed: () {
            ticketsCubit.getTickets();
          });
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ticketsCubit.filteredTickets.length,
          itemBuilder: (context, index) {
            return TicketCard(ticket: ticketsCubit.filteredTickets[index]);
          },
        );
      },
    );
  }
}
