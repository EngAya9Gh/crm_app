import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/support_clients_invoices_cubit.dart';
import 'card_support_clients_invoices.dart';

class SupportClientsInvoicesPaginatedList extends StatelessWidget {
  const SupportClientsInvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupportClientsInvoicesCubit>();
    return BlocBuilder<SupportClientsInvoicesCubit,
        SupportClientsInvoicesState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardSupportClientsInvoices(
              invoice: cubit.pageVariables.allList[index],
            );
          },
          isLoading: state.getSupportClientInvoicesStatus.isLoading(),
          onLoadMore: () async {
            await cubit.getSupportClientInvoices(isNewFilter: false);
          },
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
        );
      },
    );
  }
}
