import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../view_model/invoice_vm.dart';
import '../invoice_widget/Card_invoice_client.dart';
import 'cardwaiting.dart';

class InvoicesListView extends StatelessWidget {
  const InvoicesListView({
    Key? key,
    required this.typeCard,
  }) : super(key: key);

  final String typeCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.73,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<invoice_vm>(
          builder: (context, value, child) {
            if (value.isloading == true) {
              return Center(child: CircularProgressIndicator());
            } else if (value.listInvoicesAccept.length == 0) {
              return Center(child: Text(messageNoData));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: value.listInvoicesAccept.length,
                    itemBuilder: (context, index) {
                      // itemClient=Provider.of<client_vm>(context,listen: false)
                      //     .listClient.firstWhere(
                      //         (element) => element.idClients==value.listInvoicesAccept[index].fkIdClient);
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: typeCard == 'support'
                              ? cardWaiting(
                                  iteminvoice: value.listInvoicesAccept[index])
                              : CardInvoiceClient(
                                  type: 'profile',
                                  invoice: value.listInvoicesAccept[index],
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
