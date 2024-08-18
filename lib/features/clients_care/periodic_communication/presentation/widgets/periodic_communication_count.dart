import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/periodic_communication_cubit.dart';

class PeriodicCommunicationCount extends StatelessWidget {
  const PeriodicCommunicationCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PeriodicCommunicationCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('عدد العملاء: '),
        BlocBuilder<PeriodicCommunicationCubit, PeriodicCommunicationState>(
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
