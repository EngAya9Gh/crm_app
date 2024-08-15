import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/pending_invoices_cubit.dart';

class PendingInvoicesCount extends StatelessWidget {
  const PendingInvoicesCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PendingInvoicesCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد العملاء: ',
        ),
        BlocBuilder<PendingInvoicesCubit, PendingInvoicesState>(
          builder: (context, state) {
            return AppText(
              "${cubit.pageVariables.filteredList.length}",
              // "${cubit.pageVariables.allClientsList.length}/${cubit.pageVariables.totalClientsCount}",
            );
          },
        ),
      ],
    );
  }
}
