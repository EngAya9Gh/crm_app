import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/deleted_invoices_cubit.dart';
import 'card_deleted_invoice.dart';

class DeletedInvoicesPaginatedList extends StatelessWidget {
  const DeletedInvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<DeletedInvoicesCubit>();
    return BlocBuilder<DeletedInvoicesCubit, DeletedInvoicesState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardDeletedInvoice(
              card: _cubit.pageVariables.allList[index],
            );
          },
          isLoading: state.getDeletedInvoicesStatus.isLoading(),
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          onLoadMore: () async {
            await _cubit.getDeletedInvoices(
              isNewFilter: false,
            );
          },
        );
      },
    );
  }
}
