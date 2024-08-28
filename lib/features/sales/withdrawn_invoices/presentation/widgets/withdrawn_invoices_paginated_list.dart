import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/withdrawn_invoices_cubit.dart';

class WithdrawnInvoicesPaginatedList extends StatelessWidget {
  const WithdrawnInvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<WithdrawnInvoicesCubit>();
    return BlocBuilder<WithdrawnInvoicesCubit, WithdrawnInvoicesState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            final _invoice = _cubit.pageVariables.allList[index];
            return CardInvoiceClient(
              invoice: _cubit.pageVariables.allList[index],
              type: _invoice.stateclient == StatusClient.withdrawn.text
                  ? 'withdrawn'
                  : 'profile',
            );
          },
          isLoading: state.getWithdrawnInvoicesStatus.isLoading(),
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          onLoadMore: () async {
            await _cubit.getWithdrawnInvoices(
              isNewFilter: false,
            );
          },
        );
      },
    );
  }
}
