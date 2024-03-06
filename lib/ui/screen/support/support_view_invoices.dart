import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class support_view_invoices extends StatefulWidget {
  support_view_invoices({required this.itemClient, Key? key}) : super(key: key);

  ClientModel1 itemClient;

  @override
  support_view_invoicesState createState() => support_view_invoicesState();
}

class support_view_invoicesState extends State<support_view_invoices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
        child: Consumer<invoice_vm>(builder: (context, invoiceVm, _) {
          final listInvoice = invoiceVm.listinvoiceClientSupport;
          final isLoading = invoiceVm.isLoadingInvoicesClientParticipateLocal;

          if (isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          return listInvoice.isNotEmpty
              ? Container(
                  child: ListView.builder(
                    itemCount: listInvoice.length,
                    itemBuilder: (BuildContext context, int index) => Builder(
                        builder: (context) => SupportAdd(
                              idInvoice: listInvoice[index].idInvoice,
                              idClient: widget.itemClient.idClients,
                            )),
                  ),
                )
              : Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 50, right: 10, left: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ContainerShadows(
                      margin: EdgeInsets.only(),
                      child: Center(child: Text('العميل غير مشترك')),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
