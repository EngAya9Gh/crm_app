import 'package:crm_smart/features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/presentation/widgets/client_contacts_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../model/usermodel.dart';

class ClientsContactsPaginatedList extends StatelessWidget {
  const ClientsContactsPaginatedList({
    super.key,
    required this.isOnlyAcceptClientActivities,
    required this.userModel,
  });

  final bool isOnlyAcceptClientActivities;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final _clientsListBloc = context.read<ClientsContactsBloc>();
    return BlocBuilder<ClientsContactsBloc, ClientsContactsState>(
      buildWhen: (previous, current) {
        return previous.getAllClientsContactsStatus != current.getAllClientsContactsStatus;
      },
      builder: (context, state) {
        return AppPaginatedList(
          items: _clientsListBloc.pageVariables.allList,
          itemBuilder: (context, index) {
            final client = _clientsListBloc.pageVariables.allList[index];
            return ClientContactListItem( contact: client,);
          },
          hasReachedEnd: _clientsListBloc.pageVariables.hasReachedEnd,
          onLoadMore: () {
            // _clientsListBloc.add(GetAllClientsListEvent(
            //   isNewFilter: false,
            //   isInfiniteScroll: true,
            // ));
          },
          isLoading: _clientsListBloc.state.getAllClientsContactsStatus.isLoading(),
        );
      },
    );
  }
}
