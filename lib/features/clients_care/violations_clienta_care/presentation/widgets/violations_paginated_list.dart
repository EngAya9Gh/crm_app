import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/violations_cubit.dart';
import 'card_violations.dart';

class ViolationsPaginatedList extends StatelessWidget {
  const ViolationsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ViolationsCubit>();
    return BlocBuilder<ViolationsCubit, ViolationsState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardViolations(
              violation: cubit.pageVariables.allList[index],
              tabCareIndex: 0,
            );
          },
          onLoadMore: () async {
            await cubit.getViolations(isNewFilter: false);
          },
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
          isLoading: state.getViolationsStatus.isLoading(),
        );
      },
    );
  }
}
