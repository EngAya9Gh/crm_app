import 'package:crm_smart/core/common/widgets/app_adaptive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import 'ticket_card/ticket_card.dart';
import 'ticket_card/web_ticket_card.dart';

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
        return AppLayoutBuilder(
          smallBuilder: (context) => AppPaginatedList(
            items: _cubit.pageVariables.allList,
            itemBuilder: (context, index) =>
                TicketCard(ticket: _cubit.pageVariables.allList[index]),
          ),
          mediumBuilder: (context) => AppPaginatedList(
            listMargin: EdgeInsets.symmetric(horizontal: 20),
            items: _cubit.pageVariables.allList,
            itemBuilder: (context, index) =>
                WebTicketCard(ticket: _cubit.pageVariables.allList[index]),
          ),
        );
      },
    );
  }
}
