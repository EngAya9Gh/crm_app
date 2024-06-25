import '../../../constants.dart';
import '../../../view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoicesCounterWidget extends StatelessWidget {
  const InvoicesCounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final length =
        Provider.of<InvoiceVm>(context, listen: true).listInvoicesAccept.length;
    final totalCount = Provider.of<InvoiceVm>(context, listen: true)
        .listInvoicesAcceptTotalCount;
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'عدد الفواتير',
            style: TextStyle(
              fontFamily: kfontfamily2,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$length / $totalCount",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontFamily: kfontfamily2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
