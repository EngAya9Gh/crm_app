import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';

class ApproveFinancePage extends StatefulWidget {
  ApproveFinancePage({Key? key}) : super(key: key);

  @override
  _ApproveFinancePageState createState() => _ApproveFinancePageState();
}

class _ApproveFinancePageState extends State<ApproveFinancePage> {
  String? regoin;
  late TextEditingController _searchTextField;
  late invoice_vm _invoiceViewModel;

  @override
  void initState() {
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    _invoiceViewModel = context.read<invoice_vm>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      // if( Provider.of<privilge_vm>(context,listen: false)
      //     .checkprivlge('7'))
      //   await Provider.of<invoice_vm>(context, listen: false)
      //       .get_invoicesbyRegoin([]);//getApprovebycountry
      // if( Provider.of<privilge_vm>(context,listen: false)
      //     .checkprivlge('2'))
      //   await
      // await   Provider.of<invoice_vm>(context, listen: false)
      //        .getinvoices();
///////////////////////////////////////////////////////
      if (context.read<PrivilegeCubit>().checkPrivilege('111') == true)
        _invoiceViewModel.getinvoice_Local('مشترك', 'not approved', 'finance');
      // else{
      //   if( Provider.of<privilge_vm>(context,listen: false)
      //       .checkprivlge('7')==true)
      //     Provider.of<invoice_vm>(context, listen: false)
      //         .getinvoice_Local('مشترك','not approved','regoin');
      // }
    });
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 10)).then((_) async {
      // if( Provider.of<privilge_vm>(context,listen: false)
      //      .checkprivlge('7'))
      //  await    Provider.of<approve_vm>(context, listen: false)
      //      .getApprovebyregoin();//getApprovebycountry
      // if( Provider.of<privilge_vm>(context,listen: false)
      //      .checkprivlge('2'))
      //  await    Provider.of<approve_vm>(context, listen: false)
      //      .getApprovebycountry();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    _invoiceViewModel.onSearch_finance(_searchTextField.text);
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
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "ابحث هنا...",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //   children: [
                //     // privilge.checkprivlge('1') == true ? //regoin
                //     Provider.of<privilge_vm>(context,listen: true)
                //         .checkprivlge('111')==true?
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 8.0, right: 8),
                //         child: Consumer<regoin_vm>(
                //           builder: (context, cart, child) {
                //             return
                //               DropdownButton(
                //                 isExpanded: true,
                //                 hint: Text("الفرع"),
                //                 items: cart.listregoinfilter.map((level_one) {
                //                   return DropdownMenuItem(
                //
                //                     child: Text(level_one.name_regoin),
                //                     //label of item
                //                     value: level_one
                //                         .id_regoin, //value of item
                //                   );
                //                 }).toList(),
                //                 value: cart.selectedValueLevel,
                //                 onChanged: (value) {
                //                   //  setState(() {
                //                   cart.changeVal(value.toString());
                //                   regoin = value.toString();
                //                   filtershow();
                //                 },
                //               );
                //             //);
                //           },
                //         ),
                //       ),
                //     ):Container(),// : Container(),
                //   ],
                // ),
                // search_widget(
                //     'wait',
                //     hintnamefilter,''
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Consumer<invoice_vm>(
                    builder: (context, value, child) {
                      final list = _searchTextField.text.isEmpty
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
                                                padding: const EdgeInsets.all(2),
                                                child: cardapprove1(type: 'f', itemapprove: list[index]),
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

  void filtershow() {
    Provider.of<invoice_vm>(context, listen: false).getfilterview(regoin, 'not');
  }
}
