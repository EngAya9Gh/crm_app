import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/exceeded_clients_cubit.dart';

class ExceededClientsCount extends StatelessWidget {
  const ExceededClientsCount({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<ExceededClientsCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('عدد العملاء: '),
        BlocBuilder<ExceededClientsCubit, ExceededClientsState>(
          builder: (context, state) {
            return AppText(
              "${clientsAcceptCubit.pageVariables.filteredClientsList.length}",
              // "${clientsAcceptCubit.pageVariables.allClientsList.length}/${clientsAcceptCubit.pageVariables.totalClientsCount}",
            );
          },
        ),
      ],
    );
  }
}
