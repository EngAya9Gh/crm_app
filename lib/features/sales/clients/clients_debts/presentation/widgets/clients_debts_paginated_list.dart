import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/card_invoice_client.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../manager/clients_debts_cubit.dart';

class ClientsDebtsPaginatedList extends StatelessWidget {
  const ClientsDebtsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClientsDebtsCubit>();
    return BlocBuilder<ClientsDebtsCubit, ClientsDebtsState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardInvoiceClient(
              type: 'profile',
              invoice: cubit.pageVariables.filteredList[index],
              clientProfileRouteName:
                  AppRoutesNames.clientProfile.inClientsDebts,
            );
          },
        );
      },
    );
  }
}
