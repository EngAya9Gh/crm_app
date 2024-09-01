import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/wrong_numbers_cubit.dart';
import 'card_wrong_numbers.dart';

class WrongNumbersPaginatedList extends StatelessWidget {
  const WrongNumbersPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WrongNumbersCubit>();
    return BlocBuilder<WrongNumbersCubit, WrongNumbersState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardWrongNumbers(
              communication: cubit.pageVariables.allList[index],
              tabCareIndex: 0,
            );
          },
          onLoadMore: () async {
            await cubit.getWrongNumbers(isNewFilter: false);
          },
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
          isLoading: state.getWrongNumbersStatus.isLoading(),
        );
      },
    );
  }
}
