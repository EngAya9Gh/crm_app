import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/support_clients_invoices_cubit.dart';
import 'card_support_clients_invoices.dart';

class SupportClientsInvoicesPaginatedList extends StatelessWidget {
  const SupportClientsInvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupportClientsInvoicesCubit>();
    return BlocBuilder<SupportClientsInvoicesCubit,
        SupportClientsInvoicesState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardSupportClientsInvoices(
              invoice: cubit.pageVariables.allList[index],
            );
          },
          isLoading: state.getSupportClientInvoicesStatus.isLoading(),
          onLoadMore: () async {
            await cubit.getSupportClientInvoices(
              fkCountry: AppConstants.currentCountry,
              isNewFilter: false,
            );
          },
          hasReachedMax: cubit.pageVariables.hasReachedEnd,
        );
      },
    );
  }
}
