import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../widgets/client_widget/cardapprove1.dart';

class ApproveFinancePage extends StatefulWidget {
  ApproveFinancePage({Key? key}) : super(key: key);

  @override
  _ApproveFinancePageState createState() => _ApproveFinancePageState();
}

class _ApproveFinancePageState extends State<ApproveFinancePage> {
  String? regoin;
  late TextEditingController _searchTextField;
  late InvoiceVm _invoiceViewModel;

  @override
  void initState() {
    _searchTextField = TextEditingController();
    _invoiceViewModel = context.read<InvoiceVm>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);

      _invoiceViewModel.penddingApproveFinance();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'طلبات اعتماد المالية',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 2),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: _searchTextField,
                    onChanged: (value) {
                      _invoiceViewModel.onSearch_finance(value);
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "ابحث هنا...",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Consumer<InvoiceVm>(
                    builder: (context, value, child) {
                      final List<InvoiceModel> list =
                          _searchTextField.text.isEmpty
                              ? value.listInvoicesAccept_admin
                              : value.listApproveFinanceFilter;

                      return value.isloading == true
                          ? Center(child: CircularProgressIndicator())
                          : list.length == 0
                              ? Center(child: Text(messageNoData))
                              : Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: list.length,
                                          itemBuilder: (context, index) {
                                            return SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: cardapprove1(
                                                    type: 'f',
                                                    itemapprove: list[index]),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
