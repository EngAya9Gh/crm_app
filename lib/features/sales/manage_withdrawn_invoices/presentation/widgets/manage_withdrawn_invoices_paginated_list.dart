import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/manage_withdrawn_invoices_cubit.dart';

class ManageWithdrawnInvoicesPaginatedList extends StatelessWidget {
  const ManageWithdrawnInvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<ManageWithdrawnInvoicesCubit>();
    return BlocBuilder<ManageWithdrawnInvoicesCubit,
        ManageWithdrawnInvoicesState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardInvoiceClient(

              type: 'withdrawn',
              invoice: _cubit.pageVariables.allList[index],
              isFromWithdrawalsInvoicesList: true,
            );
          },
          isLoading: state.getManageWithdrawnInvoicesStatus.isLoading(),
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          onLoadMore: () async {
            await _cubit.getManageWithdrawnInvoices(
              isNewFilter: false,
            );
          },
        );
      },
    );
  }
}
