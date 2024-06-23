import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:crm_smart/features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoicesPaginatedList extends StatefulWidget {
  const InvoicesPaginatedList({super.key});

  @override
  State<InvoicesPaginatedList> createState() => _InvoicesPaginatedListState();
}

class _InvoicesPaginatedListState extends State<InvoicesPaginatedList> {
  late final ScrollController _scrollController;
  late final InvoicesTabCubit invoicesTabCubit;

  @override
  void initState() {
    super.initState();
    invoicesTabCubit = context.read<InvoicesTabCubit>();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 100) {
      invoicesTabCubit.getInvoicesByPrivileges(isNewFilter: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoicesTabCubit, InvoicesTabState>(
      builder: (context, state) {
        if (state.getInvoicesStatus.isLoading &&
            invoicesTabCubit.invoicesList.isEmpty) {
          return CustomLoadingIndicator();
        } else if (state.getInvoicesStatus.isFailed &&
            invoicesTabCubit.invoicesList.isEmpty) {
          return CustomErrorWidget(
            onPressed: () {
              invoicesTabCubit.getInvoicesByPrivileges(isNewFilter: true);
            },
          );
        } else if (invoicesTabCubit.invoicesList.isEmpty) {
          return CustomErrorWidget(message: 'لا توجد فواتير');
        }

        return Expanded(
          child: ListView.separated(
            controller: _scrollController,
            itemCount: invoicesTabCubit.invoicesList.length +
                (state.getInvoicesStatus.isLoading ? 1 : 0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (_, __) => const SizedBox.shrink(),
            itemBuilder: (context, index) {
              if (index == invoicesTabCubit.invoicesList.length) {
                return state.getInvoicesStatus.isLoading
                    ? CustomLoadingIndicator()
                    : SizedBox.shrink();
              }
              return CardInvoiceClient(
                type: 'profile',
                invoice: invoicesTabCubit.invoicesList[index],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    invoicesTabCubit.getInvoicesParams = GetInvoicesByPrivilegesParams();
    super.dispose();
  }
}
