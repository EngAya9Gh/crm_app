import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/widgets/Card_invoice_client.dart';
import '../../../core/common/widgets/custom_error_widget.dart';
import '../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/maincity_vm.dart';
import 'cardwaiting.dart';

class InvoicesListView extends StatefulWidget {
  const InvoicesListView({
    super.key,
    required this.typeCard,
  });

  final String typeCard;

  @override
  State<InvoicesListView> createState() => _InvoicesListViewState();
}

class _InvoicesListViewState extends State<InvoicesListView> {
  late final ScrollController _scrollController;
  late final InvoiceVm invoiceVm;

  @override
  void initState() {
    super.initState();
    invoiceVm = Provider.of<InvoiceVm>(context, listen: false);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 50) {
      invoiceVm.filterInvoices(
        listSelectedRegions: context.read<MainCityProvider>().selectedRegions,
        selectedCities: context.read<MainCityProvider>().filteredCitiesList,
        isNewFilter: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceVm>(
      builder: (context, value, child) {
        if (value.isloading == true && value.listInvoicesAccept.isEmpty) {
          return CustomLoadingIndicator();
        } else if (value.listInvoicesAccept.isEmpty) {
          return CustomErrorWidget(message: messageNoData);
        }
        return ListView.separated(
          controller: _scrollController,
          itemCount:
              value.listInvoicesAccept.length + (value.isloading ? 1 : 0),
          padding: EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (_, __) => const SizedBox.shrink(),
          itemBuilder: (context, index) {
            if (index == value.listInvoicesAccept.length) {
              return value.isloading
                  ? CustomLoadingIndicator(padding: 5)
                  : SizedBox.shrink();
            }

            return widget.typeCard == 'support'
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: cardWaiting(
                        iteminvoice: value.listInvoicesAccept[index]),
                  )
                : CardInvoiceClient(
                    type: 'profile',
                    invoice: value.listInvoicesAccept[index],
                  );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
