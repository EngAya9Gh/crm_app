import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/latest_clients_updates_cubit.dart';
import 'card_latest_clients_updates.dart';

class LatestClientsUpdatesPaginatedList extends StatelessWidget {
  const LatestClientsUpdatesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final latestUpdatesCubit = context.read<LatestClientsUpdatesCubit>();
    return BlocBuilder<LatestClientsUpdatesCubit, LatestClientsUpdatesState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: latestUpdatesCubit.pageVariables.latestUpdates,
          onLoadMore: () => latestUpdatesCubit.getLatestClients(
            isNewFilter: false,
          ),
          itemBuilder: (context, index) {
            return CardLatestClientsUpdates(
              latestUpdate:
                  latestUpdatesCubit.pageVariables.latestUpdates[index],
            );
          },
          isLoading: state.getLatestClientsStatus.isLoading(),
          hasReachedMax: state.getLatestClientsStatus.data ?? false,
          scrollController: ScrollController(),
        );
      },
    );
  }
}
