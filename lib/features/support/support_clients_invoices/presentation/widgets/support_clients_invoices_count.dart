import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/support_clients_invoices_cubit.dart';

class SupportClientsInvoicesCount extends StatelessWidget {
  const SupportClientsInvoicesCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupportClientsInvoicesCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد الفواتير: ',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<SupportClientsInvoicesCubit, SupportClientsInvoicesState>(
          builder: (context, state) {
            return Text(
              "${cubit.pageVariables.allList.length}/${cubit.pageVariables.totalCount}",
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
