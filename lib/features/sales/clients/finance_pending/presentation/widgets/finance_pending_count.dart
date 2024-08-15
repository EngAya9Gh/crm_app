import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/finance_pending_cubit.dart';

class FinancePendingCount extends StatelessWidget {
  const FinancePendingCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FinancePendingCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('عدد العملاء: '),
        BlocBuilder<FinancePendingCubit, FinancePendingState>(
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
