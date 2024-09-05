import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/clients_accept_cubit.dart';
import 'card_client_accept.dart';

class ClientsAcceptPaginatedList extends StatelessWidget {
  const ClientsAcceptPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<ClientsAcceptCubit>();
    return BlocBuilder<ClientsAcceptCubit, ClientsAcceptState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: clientsAcceptCubit.pageVariables.allList,
          onLoadMore: () => clientsAcceptCubit.getClientsAccept(
            isNewFilter: false,
          ),
          itemBuilder: (context, index) {
            return CardClientAccept(
              client: clientsAcceptCubit.pageVariables.allList[index],
            );
          },
          isLoading: state.getClientsAcceptStatus.isLoading(),
          hasReachedEnd: state.getClientsAcceptStatus.data ?? false,
          scrollController: ScrollController(),
        );
      },
    );
  }
}
