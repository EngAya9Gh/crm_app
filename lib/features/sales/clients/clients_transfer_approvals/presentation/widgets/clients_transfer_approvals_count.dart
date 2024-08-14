import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_transfer_approvals_cubit.dart';

class ClientsTransferApprovalsCount extends StatelessWidget {
  const ClientsTransferApprovalsCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClientsTransferApprovalsCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد العملاء: ',
        ),
        BlocBuilder<ClientsTransferApprovalsCubit,
            ClientsTransferApprovalsState>(
          builder: (context, state) {
            return AppText(
              "${cubit.pageVariables.filteredList.length}",
              // "${cubit.pageVariables.allClientsList.length}/${cubit.pageVariables.totalClientsCount}",
            );
          },
        ),
      ],
    );
  }
}
