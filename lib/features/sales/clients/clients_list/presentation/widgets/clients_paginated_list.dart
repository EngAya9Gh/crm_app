import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../model/usermodel.dart';
import '../manager/clients_list_bloc.dart';
import 'client_card.dart';
import 'client_card_pluse.dart';

class ClientsPaginatedList extends StatelessWidget {
  const ClientsPaginatedList({
    super.key,
    required this.isOnlyAcceptClientActivities,
    required this.userModel,
  });

  final bool isOnlyAcceptClientActivities;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final _clientsListBloc = context.read<ClientsListBloc>();
    return BlocBuilder<ClientsListBloc, ClientsListState>(
      buildWhen: (previous, current) {
        return previous.getAllClientsStatus != current.getAllClientsStatus;
      },
      builder: (context, state) {
        return AppPaginatedList(
          items: _clientsListBloc.pageVariables.allList,
          itemBuilder: (context, index) {
            final client = _clientsListBloc.pageVariables.allList[index];
            return isOnlyAcceptClientActivities == true
                ? CardClient_pluse(clientModel: client)
                : CardClient(clientModel: client);
          },
          hasReachedEnd: _clientsListBloc.pageVariables.hasReachedEnd,
          onLoadMore: () {
            _clientsListBloc.add(GetAllClientsListEvent(
              isNewFilter: false,
              isInfiniteScroll: true,
            ));
          },
          isLoading: _clientsListBloc.state.getAllClientsStatus.isLoading(),
        );
      },
    );
  }
}
