import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/not_using_system_cubit.dart';
import 'card_not_using_system.dart';

class NotUsingSystemPaginatedList extends StatelessWidget {
  const NotUsingSystemPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotUsingSystemCubit>();
    return BlocBuilder<NotUsingSystemCubit, NotUsingSystemState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardNotUsingSystem(
              communication: cubit.pageVariables.allList[index],
              tabCareIndex: 0,
            );
          },
          onLoadMore: () async {
            await cubit.getNotUsingSystem(isNewFilter: false);
          },
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
          isLoading: state.getNotUsingSystemStatus.isLoading(),
        );
      },
    );
  }
}
