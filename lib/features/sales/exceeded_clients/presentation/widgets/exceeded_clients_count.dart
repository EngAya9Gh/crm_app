import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/build_context.dart';
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
        AppText(
          'عدد العملاء: ',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<ExceededClientsCubit, ExceededClientsState>(
          builder: (context, state) {
            return Text(
              "${clientsAcceptCubit.pageVariables.filteredClientsList.length}",
              // "${clientsAcceptCubit.pageVariables.allClientsList.length}/${clientsAcceptCubit.pageVariables.totalClientsCount}",
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
