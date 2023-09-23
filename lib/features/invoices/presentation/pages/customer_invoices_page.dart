import 'package:crm_smart/features/invoices/presentation/constants/invoices_string.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/material.dart';

import '../../../../ui/widgets/invoice_widget/Card_invoice_client.dart';

class CustomerInvoicesPage extends StatefulWidget {
  const CustomerInvoicesPage({Key? key}) : super(key: key);

  @override
  State<CustomerInvoicesPage> createState() => _CustomerInvoicesState();
}

class _CustomerInvoicesState extends State<CustomerInvoicesPage> {
  final _searchController = TextEditingController();
  final _customerTypeController = TextEditingController();
  final _sellerNameController = TextEditingController();
  final _sectionController = TextEditingController();
  final _fromDateController =
      TextEditingController(text: InvoicesString.fromDate);
  final _toDateController = TextEditingController(text: InvoicesString.toDate);

  @override
  void dispose() {
    _searchController.dispose();
    _customerTypeController.dispose();
    _sellerNameController.dispose();
    _sectionController.dispose();
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(InvoicesString.customerInvoices),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ///------SelectCustomer And Seller Name------///
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          hintText: InvoicesString.customerTypesList.first),
                      onChanged: (value) {
                        _customerTypeController.text = value.toString();
                        //TODO : change selected value
                      },
                      items: InvoicesString.customerTypesList
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                    ),
                  ),
                  Visibility(
                    visible: _customerTypeController.text !=
                        InvoicesString.customerTypesList.first,
                    child: SizedBox(
                      width: 10.0,
                    ),
                  ),
                  Visibility(
                    visible: _customerTypeController.text !=
                        InvoicesString.customerTypesList.first,
                    child: Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            hintText: InvoicesString.selectCustomer),
                        onChanged: (value) {
                          _sellerNameController.text = value.toString();
                          //TODO : change selected value
                        },
                        //ToDO : get from api
                        items: InvoicesString.customerTypesList
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ///------SelectSection------///
              DropdownButtonFormField(
                decoration:
                    InputDecoration(hintText: InvoicesString.selectSection),
                onChanged: (value) {
                  _sectionController.text = value.toString();
                  //TODO : change selected value
                },
                //ToDo://get this from api
                items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                    .map((e) => DropdownMenuItem(
                          child: Text(' فرع ${e}'),
                          value: e,
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 20,
              ),

              ///------SelectSection------///
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                    ),
                    controller: _fromDateController,
                    readOnly: true,
                    onTap: () {},
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                    ),
                    controller: _toDateController,
                    readOnly: true,
                    onTap: () {},
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ///------Search------///
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(hintText: InvoicesString.searchHere,
                prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 10,
              ),

              ///------Invoices Number------///
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text(InvoicesString.invoicesNumber),
                trailing: Text('#381'),
              ),

              ///------Invoices Number------///
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => CardInvoiceClient(
                        type: 'profile',
                        itemProd: InvoiceModel(products: [
                          ProductsInvoice()
                        ]),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(
                            height: 10.0,
                          ),
                      itemCount: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
