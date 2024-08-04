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
          itemBuilder: (context, index) {
            return CardExceededClients(
              client:
                  clientsAcceptCubit.pageVariables.filteredClientsList[index],
            );
          },
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
