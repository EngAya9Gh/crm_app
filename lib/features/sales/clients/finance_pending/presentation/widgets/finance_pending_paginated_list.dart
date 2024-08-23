import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/finance_pending_cubit.dart';
import 'card_finance_pending.dart';

class FinancePendingPaginatedList extends StatelessWidget {
  const FinancePendingPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FinancePendingCubit>();
    return BlocBuilder<FinancePendingCubit, FinancePendingState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardFinancePending(
              invoice: cubit.pageVariables.filteredList[index],
            );
          },
        );
      },
    );
  }
}
