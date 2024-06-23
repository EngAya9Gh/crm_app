import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../../../view_model/invoice_vm.dart';

class InvoicesTab extends StatefulWidget {
  InvoicesTab({
    required this.itemClient,
    required this.fkclient,
    required this.fkuser,
    Key? key,
  }) : super(key: key);

  String fkclient, fkuser;
  ClientModel1 itemClient;

  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<InvoicesTab> {
  late final SupportTabCubit supportTabCubit;

  @override
  void initState() {
    supportTabCubit = context.read<SupportTabCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 20),
        child: Column(
          children: [
            CustomButton(
              text: 'إنشاء فاتورة جديدة',
              onTap: () async {
                AppNavigator.push(AddInvoice(itemClient: widget.itemClient));
              },
            ),
            Expanded(
              // child: BlocBuilder<SupportTabCubit, SupportTabState>(
              //   builder: (context, state) {
              //     if (state.getInvoiceByClientStatus.isLoading()) {
              //       return CustomLoadingIndicator();
              //     } else if (state.getInvoiceByClientStatus.isFailed()) {
              //       return CustomErrorWidget(
              //         message: state.getInvoiceByClientStatus.error,
              //       );
              //     } else if (supportTabCubit.clientInvoicesList.isEmpty) {
              //       return CustomErrorWidget(message: 'لا توجد فواتير');
              //     }
              //     return ListView.separated(
              //       itemCount: supportTabCubit.clientInvoicesList.length,
              //       padding: EdgeInsets.symmetric(horizontal: 20),
              //       separatorBuilder: (_, __) => const SizedBox.shrink(),
              //       itemBuilder: (context, index) {
              //         return Builder(
              //           builder: (context) => CardInvoiceClient(
              //             type: '',
              //             invoice: supportTabCubit.clientInvoicesList[index],
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              child: Consumer<InvoiceVm>(
                builder: (context, value, child) {
                  final listInvoice = value.listInvoiceClient;

                  final isLoading = value.isLoadingInvoicesClientLocal;

                  if (isLoading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }

                  return ListView.separated(
                    itemCount: listInvoice.length,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(indent: 2, endIndent: 2),
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
