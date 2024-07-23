import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/invoices_section_cubit.dart';

class InvoicesPaginatedList extends StatelessWidget {
  const InvoicesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _invoicesSectionCubit = context.read<InvoicesSectionCubit>();
    return BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
      builder: (context, state) {
        if (state.getInvoicesStatus.isLoading &&
            _invoicesSectionCubit.invoicesList.isEmpty) {
          return Expanded(child: CustomLoadingIndicator());
        } else if (state.getInvoicesStatus.isFailed &&
            _invoicesSectionCubit.invoicesList.isEmpty) {
          return CustomErrorWidget(
            onPressed: () {
              _invoicesSectionCubit.getInvoicesByPrivileges(isNewFilter: true);
            },
          );
        } else if (_invoicesSectionCubit.invoicesList.isEmpty) {
          return CustomErrorWidget(message: 'لا توجد فواتير');
        }
        return Expanded(
          child: CustomPaginatedList(
            scrollController: ScrollController(),
            isLoading: state.getInvoicesStatus.isLoading,
            items: _invoicesSectionCubit.invoicesList,
            hasReachedMax: _invoicesSectionCubit.hasReachedEnd,
            onLoadMore: () {
              _invoicesSectionCubit.getInvoicesByPrivileges(isNewFilter: false);
            },
            itemBuilder: (context, index) {
              return CardInvoiceClient(
                type: 'profile',
                invoice: _invoicesSectionCubit.invoicesList[index],
              );
            },
            separatorBuilder: (_, __) => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
