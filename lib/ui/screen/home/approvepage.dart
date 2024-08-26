import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../widgets/client_widget/cardapprove1.dart';

class ApprovePage extends StatefulWidget {
  ApprovePage({super.key});

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
          style: TextStyle(
              color: AppColors.kWhiteColor, fontFamily: AppFonts.fontFamily2),
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
                    context.read<PrivilegesCubit>().checkPrivilege('2')
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
                                        child: Text(level_one.branchName),
                                        //label of item
                                        value:
                                            level_one.branchId, //value of item
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
                  hint: AppStrings.global.searchHint,
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
                            ? Center(child: Text(AppStrings.global.noDataExist))
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
