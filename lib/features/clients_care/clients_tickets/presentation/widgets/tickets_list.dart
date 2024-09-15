import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/ticket_card.dart';

class TicketsPaginatedList extends StatelessWidget {
  const TicketsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<TicketsCubit>();
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) {
        return current.getTicketsStatus != previous.getTicketsStatus;
      },
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return TicketCard(ticket: _cubit.pageVariables.allList[index]);
          },
          isLoading: state.getTicketsStatus.isLoading(),
          onLoadMore: () async => await _cubit.getTickets(isNewFilter: false),
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
        );
      },
    );
  }
}
