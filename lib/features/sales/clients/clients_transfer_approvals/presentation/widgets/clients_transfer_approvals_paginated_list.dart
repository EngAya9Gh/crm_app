import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/clients_transfer_approvals_cubit.dart';
import 'card_clients_transfer_approvals.dart';

class ClientsTransferApprovalsPaginatedList extends StatelessWidget {
  const ClientsTransferApprovalsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClientsTransferApprovalsCubit>();
    return BlocBuilder<ClientsTransferApprovalsCubit,
        ClientsTransferApprovalsState>(builder: (context, state) {
      return CustomPaginatedList(
        items: cubit.pageVariables.filteredList,
        itemBuilder: (context, index) {
          return CardClientsTransferApprovals(
            client: cubit.pageVariables.filteredList[index],
          );
        },
      );
    });
  }
}
