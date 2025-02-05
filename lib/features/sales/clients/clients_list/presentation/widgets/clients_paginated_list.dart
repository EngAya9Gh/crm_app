import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/clients_list_bloc.dart';
import 'client_card.dart';
import 'client_card_pluse.dart';

class ClientsPaginatedList extends StatelessWidget {
  ClientsPaginatedList({
    super.key,
    required this.isOnlyAcceptClientActivities,
    required this.userModel,
    this.widgetToChose,
  });

  final bool isOnlyAcceptClientActivities;
  final UserModel userModel;
  final Widget? widgetToChose;

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
            return ValueListenableBuilder(
              valueListenable: _clientsListBloc.pageVariables.selectedItemsId,
              builder: (context, value, child) {
                var choiceWidget = context.read<PrivilegesCubit>().checkPrivilege('326')
                    ? Checkbox(
                        value: value.contains(client.idClients),
                        onChanged: (value) {
                          if (value ?? false) {
                            _clientsListBloc.pageVariables.selectedItemsId.value = List.of(_clientsListBloc.pageVariables.selectedItemsId.value)
                              ..add(client.idClients!);
                          } else {
                            _clientsListBloc.pageVariables.selectedItemsId.value = List.of(_clientsListBloc.pageVariables.selectedItemsId.value)
                              ..removeWhere((element) => element == client.idClients);
                          }
                        },
                      )
                    : SizedBox.shrink();
                return isOnlyAcceptClientActivities == true
                    ? CardClient_pluse(
                        clientModel: client,
                        widget: choiceWidget,
                      )
                    : CardClient(
                        clientModel: client,
                        widget: choiceWidget,
                      );
              },
            );
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
