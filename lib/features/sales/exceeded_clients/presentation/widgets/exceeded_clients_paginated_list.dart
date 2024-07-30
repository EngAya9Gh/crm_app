import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/exceeded_clients_cubit.dart';
import 'card_exceeded_clients.dart';

class ExceededClientsPaginatedList extends StatelessWidget {
  const ExceededClientsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<ExceededClientsCubit>();
    return BlocBuilder<ExceededClientsCubit, ExceededClientsState>(
      buildWhen: (previous, current) {
        return _buildWhen(previous, current);
      },
      builder: (context, state) {
        return CustomPaginatedList(
          items: clientsAcceptCubit.pageVariables.filteredClientsList,
          onLoadMore: () {},
          // todo: uncomment this when pagination is implemented
          // onLoadMore: () => clientsAcceptCubit.getSupportClientsAccept(
          //   fkCountry: AppConstants.currentCountry(context) ?? '',
          //   isNewFilter: false,
          // ),
          itemBuilder: (context, index) {
            return CardExceededClients(
              client:
                  clientsAcceptCubit.pageVariables.filteredClientsList[index],
            );
          },
          isLoading: state.getExceededClientsStatus.isLoading(),
          hasReachedMax: state.getExceededClientsStatus.data ?? false,
          scrollController: ScrollController(),
        );
      },
    );
  }

  bool _buildWhen(ExceededClientsState previous, ExceededClientsState current) {
    return (previous.getExceededClientsStatus !=
                current.getExceededClientsStatus ||
            previous.locallyFilterExceededClientsStatus !=
                current.locallyFilterExceededClientsStatus) &&
        !current.transferExceededClientsStatus.isFailed();
  }
}
