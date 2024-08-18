import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/greeting_communication_cubit.dart';

class GreetingCommunicationCount extends StatelessWidget {
  const GreetingCommunicationCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GreetingCommunicationCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('عدد العملاء: '),
        BlocBuilder<GreetingCommunicationCubit, GreetingCommunicationState>(
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
