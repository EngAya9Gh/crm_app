import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class invoices extends StatefulWidget {
  invoices({
    required this.itemClient,
    required this.fkclient,
    required this.fkuser,
    Key? key,
  }) : super(key: key);

  String fkclient, fkuser;
  ClientModel itemClient;

  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<invoices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2,top: 20),
        child: Column(
          children: [
            CustomButton(
              text: 'إنشاء فاتورة جديدة',
              onTap: () async {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (context) => addinvoice(itemClient: widget.itemClient)));
              },
            ),
            Expanded(
              child: Consumer<invoice_vm>(
                builder: (context, value, child) {
                  final listInvoice = value.listinvoiceClient;
                  final isLoading = value.isLoadingInvoicesClientLocal;

                  if (isLoading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }

                  return ListView.separated(
                    itemCount: listInvoice.length,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    separatorBuilder: (BuildContext context, int index) => const Divider(indent: 2,endIndent: 2),
                    itemBuilder: (BuildContext context, int index) => Builder(
                      builder: (context) => CardInvoiceClient(
                        type: '',
                        invoice: listInvoice[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
