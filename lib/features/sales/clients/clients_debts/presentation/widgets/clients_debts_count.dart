import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_debts_cubit.dart';

class ClientsDebtsCount extends StatelessWidget {
  const ClientsDebtsCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClientsDebtsCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('عدد العملاء: '),
        BlocBuilder<ClientsDebtsCubit, ClientsDebtsState>(
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
