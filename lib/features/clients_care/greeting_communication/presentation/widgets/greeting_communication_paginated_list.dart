import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/greeting_communication_cubit.dart';
import 'card_greeting_communication.dart';

class GreetingCommunicationPaginatedList extends StatelessWidget {
  const GreetingCommunicationPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GreetingCommunicationCubit>();
    return BlocBuilder<GreetingCommunicationCubit, GreetingCommunicationState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardGreetingCommunication(
              communication: cubit.pageVariables.allList[index],
              tabCareIndex: 0,
            );
          },
          onLoadMore: () async {
            await cubit.getGreetingCommunication(isNewFilter: false);
          },
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
          isLoading: state.getGreetingCommunicationStatus.isLoading(),
        );
      },
    );
  }
}
