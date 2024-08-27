import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
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
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardPeriodicCommunication(
              communication: cubit.pageVariables.allList[index],
              tabCareIndex: cubit.pageVariables.switchValue ? 1 : 2,
            );
          },
          onLoadMore: () async {
            await cubit.getPeriodicCommunication(isNewFilter: false);
          },
          isLoading: state.getPeriodicCommunicationStatus.isLoading(),
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
        );
      },
    );
  }
}
