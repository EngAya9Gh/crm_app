import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../widgets/client_widget/cardapprove1.dart';

class ApprovePage extends StatefulWidget {
  ApprovePage({Key? key}) : super(key: key);

  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  late final InvoiceVm invoiceVm;
  String? regoin;

  @override
  void initState() {
    invoiceVm = Provider.of<InvoiceVm>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await invoiceVm.penddingApprove('');
      invoiceVm.initApproveInvoicesAdminList();
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'طلبات الموافقة',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    context.read<PrivilegeCubit>().checkPrivilege('2')
                        ? Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Consumer<RegionProvider>(
                                builder: (context, cart, child) {
                                  return DropdownButton(
                                    isExpanded: true,
                                    hint: Text("الفرع"),
                                    items:
                                        cart.listRegionFilter.map((level_one) {
                                      return DropdownMenuItem(
                                        child: Text(level_one.regionName),
                                        //label of item
                                        value:
                                            level_one.regionId, //value of item
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
                          )
                        : Container(), // : Container(),
                  ],
                ),
                CustomSearchWidget(
                  hint: hintnamefilter,
                  searchController: TextEditingController(),
                  onChanged: (value) {
                    invoiceVm.searchApproveInvoicesAdmin(value);
                  },
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: Consumer<InvoiceVm>(builder: (context, value, child) {
                    return value.isloading == true
                        ? Center(child: CircularProgressIndicator())
                        : value.approveInvoicesAdminList.length == 0
                            ? Center(child: Text(messageNoData))
                            : Column(
                                children: [
                                  Expanded(
                                    //flex: 1,
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: value
                                            .approveInvoicesAdminList.length,
                                        itemBuilder: (context, index) {
                                          return SingleChildScrollView(
                                              child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: cardapprove1(
                                              itemapprove: value
                                                      .approveInvoicesAdminList[
                                                  index],
                                              type: '',
                                              //data: widget.data,
                                            ),
                                          ));
                                        }),
                                  ),
                                ],
                              );
                  }),
                ),
              ],
            )),
      ),
    );
  }

  void filtershow() {
    invoiceVm.penddingApprove(regoin.toString());
  }
}
