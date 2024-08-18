import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/greeting_communication_cubit.dart';
import 'card_greeting_communication.dart';

class GreetingCommunicationPaginatedList extends StatelessWidget {
  const GreetingCommunicationPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GreetingCommunicationCubit>();
    return BlocBuilder<GreetingCommunicationCubit, GreetingCommunicationState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardGreetingCommunication(
              communication: cubit.pageVariables.filteredList[index],
              tabCareIndex: 0,
            );
          },
        );
      },
    );
  }
}
