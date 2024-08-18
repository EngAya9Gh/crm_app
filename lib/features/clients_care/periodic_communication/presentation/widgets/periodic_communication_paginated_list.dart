import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/periodic_communication_cubit.dart';
import 'card_periodic_communication.dart';

class PeriodicCommunicationPaginatedList extends StatelessWidget {
  const PeriodicCommunicationPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PeriodicCommunicationCubit>();
    return BlocBuilder<PeriodicCommunicationCubit, PeriodicCommunicationState>(
      buildWhen: (previous, current) =>
          previous.getPeriodicCommunicationStatus !=
          current.getPeriodicCommunicationStatus,
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardPeriodicCommunication(
              communication: cubit.pageVariables.filteredList[index],
              tabCareIndex: 1,
            );
          },
        );
      },
    );
  }
}
