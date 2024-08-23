import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/previous_ratings_cubit.dart';
import 'card_previous_ratings.dart';

class PreviousRatingsPaginatedList extends StatelessWidget {
  const PreviousRatingsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PreviousRatingsCubit>();
    return BlocBuilder<PreviousRatingsCubit, PreviousRatingsState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardPreviousRatings(
              communication: cubit.pageVariables.filteredList[index],
              tabCareIndex: 1,
            );
          },
        );
      },
    );
  }
}
