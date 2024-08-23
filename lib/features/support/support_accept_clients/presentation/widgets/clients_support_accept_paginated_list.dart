import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/support_clients_accept_cubit.dart';
import 'card_support_client_accept.dart';

class ClientsSupportAcceptPaginatedList extends StatelessWidget {
  const ClientsSupportAcceptPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<SupportClientsAcceptCubit>();
    return BlocBuilder<SupportClientsAcceptCubit, SupportClientsAcceptState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: clientsAcceptCubit.pageVariables.filteredClientsList,
          itemBuilder: (context, index) {
            return CardSupportClientAccept(
              client:
                  clientsAcceptCubit.pageVariables.filteredClientsList[index],
            );
          },
        );
      },
    );
  }
}
