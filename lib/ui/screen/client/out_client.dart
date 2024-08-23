import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/widgets/card_invoice_client.dart';
import '../../../core/utils/app_colors.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/typeclient.dart';
import '../search/search_container.dart';

class OutClient extends StatefulWidget {
  OutClient({super.key});

  @override
  _OutClientState createState() => _OutClientState();
}

class _OutClientState extends State<OutClient> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel itemClient;

  // late String typepayController;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientTypeProvider>(context, listen: false)
          .changelisttype_install(null);
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);

      Provider.of<InvoiceVm>(context, listen: false).getwithdarwlInvoice('');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفواتير المنسحبة ',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // privilge.checkprivlge('1') == true ? //regoin
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Consumer<RegionProvider>(
                            builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text("الفرع"),
                                items: cart.listRegionFilter.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one.branchName),
                                    //label of item
                                    value: level_one.branchId, //value of item
                                  );
                                }).toList(),
                                value: cart.selectedRegionId,
                                onChanged: (value) {
                                  //  setState(() {
                                  cart.changeVal(value.toString());
                                  regoin = value.toString();
                                  filtershow();
                                },
                              );
                              //);
                            },
                          ),
                        ),
                      ), // : Container(),
                    ],
                  ),
                  search_widget('waitout', hintnamefilter, ''
                      // Provider
                      //     .of<invoice_vm>(context, listen: true)
                      //     .listInvoicesAccept,
                      ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Consumer<InvoiceVm>(builder: (context, value, child) {
                        return value.isloading == true
                            ? Center(child: CircularProgressIndicator())
                            : value.listInvoicesAccept.length == 0
                                ? Center(
                                    child: Text(messageNoData),
                                  )
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                value.listInvoicesAccept.length,
                                            itemBuilder: (context, index) {
                                              // itemClient=Provider.of<client_vm>(context,listen: false)
                                              //     .listClient.firstWhere(
                                              //         (element) => element.idClients==value.listInvoicesAccept[index].fkIdClient);
                                              final invoice = value
                                                  .listInvoicesAccept[index];
                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  child: CardInvoiceClient(
                                                    // stateclient
                                                    type: invoice.stateclient ==
                                                            StatusClient
                                                                .withdrawn.text
                                                        ? 'withdrawn'
                                                        : 'profile',
                                                    invoice: invoice,
                                                    //itemClient :  itemClient,
                                                  ));
                                            }),
                                      ),
                                    ],
                                  );
                      }),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void filtershow() {
    Provider.of<InvoiceVm>(context, listen: false)
        .getwithdarwlInvoice(regoin.toString());
  }
}
