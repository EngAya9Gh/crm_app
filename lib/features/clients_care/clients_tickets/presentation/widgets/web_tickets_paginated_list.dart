import 'package:crm_smart/features/clients_care/clients_tickets/presentation/widgets/ticket_card/web_ticket_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';

class WebTicketsPaginatedList extends StatelessWidget {
  const WebTicketsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<TicketsCubit>();
    return BlocBuilder<TicketsCubit, TicketsState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.getTicketsStatus.isFailed()) {
          return AppErrorWidget(
            message: state.getTicketsStatus.error ?? '',
            onPressed: () =>  _cubit.getTickets(),
          );
        } else if (state.getTicketsStatus.isEmpty()) {
          return const Center(child: AppText('لا يوجد نتائج'));
        }else if( state.getTicketsStatus.isLoading() && _cubit.pageVariables.allList.isEmpty){
          return const Center(child: AppLoader(),);
        }
        return  AppPaginatedList(
          items: _cubit.pageVariables.allList,
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          isLoading: state.getTicketsStatus.isLoading(),
          onLoadMore: () async {
            await _cubit.getTickets(isNewFilter: false);
          },
          itemBuilder: (context, index) =>
              WebTicketCard(ticket: _cubit.pageVariables.allList[index]),
        );
      },
    );
  }
}
