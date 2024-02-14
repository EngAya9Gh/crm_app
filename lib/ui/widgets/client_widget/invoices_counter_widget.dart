import 'package:crm_smart/constants.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoicesCounterWidget extends StatelessWidget {
  const InvoicesCounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Provider.of<invoice_vm>(context, listen: true)
                .listInvoicesAccept
                .length
                .toString(),
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
