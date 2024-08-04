import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/pending_invoices_cubit.dart';
import 'card_pending_invoices.dart';

class PendingInvoicesPaginatedList extends StatelessWidget {
  const PendingInvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PendingInvoicesCubit>();
    return BlocBuilder<PendingInvoicesCubit, PendingInvoicesState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardPendingInvoices(
              invoice: cubit.pageVariables.filteredList[index],
            );
          },
        );
      },
    );
  }
}
