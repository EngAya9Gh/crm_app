import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/usermodel.dart';
import '../manager/clients_list_bloc.dart';
import 'client_card.dart';
import 'client_card_pluse.dart';

class ClientsPaginatedList extends StatelessWidget {
  const ClientsPaginatedList({
    super.key,
    required this.value,
    required this.userModel,
  });

  final bool value;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final _clientsListBloc = context.read<ClientsListBloc>();
    return BlocBuilder<ClientsListBloc, ClientsListState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: _clientsListBloc.pageVariables.allList,
          itemBuilder: (context, index) {
            final client = _clientsListBloc.pageVariables.allList[index];
            return value == true
                ? CardClient_pluse(clientModel: client)
                : CardClient(clientModel: client);
          },
          hasReachedEnd: _clientsListBloc.pageVariables.hasReachedEnd,
          onLoadMore: () {
            _clientsListBloc.add(GetAllClientsListEvent(
              fkCountry: AppConstants.currentCountry,
              isNewFilter: false,
            ));
          },
          isLoading: _clientsListBloc.state.getAllClientsStatus.isLoading(),
        );
      },
    );
  }
}
