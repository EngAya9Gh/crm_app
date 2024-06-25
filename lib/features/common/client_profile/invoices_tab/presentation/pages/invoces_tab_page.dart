import '../../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/clientmodel.dart';
import '../../../../../../ui/screen/invoice/addInvoice.dart';
import '../../../../../../ui/widgets/custom_widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../view_model/invoice_vm.dart';
import '../../../support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';

class InvoicesTabPage extends StatefulWidget {
  const InvoicesTabPage({
    required this.itemClient,
    required this.fkClient,
    required this.fkUser,
    Key? key,
  }) : super(key: key);

  final String fkClient;
  final String fkUser;
  final ClientModel1 itemClient;

  @override
  State<InvoicesTabPage> createState() => _InvoicesState();
}

class _InvoicesState extends State<InvoicesTabPage> {
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
              child: Consumer<InvoiceVm>(
                builder: (context, value, child) {
                  final listInvoice = value.listInvoiceClient;

                  final isLoading = value.isLoadingInvoicesClientLocal;

                  if (isLoading) {
                    return CustomLoadingIndicator();
                  }

                  return ListView.separated(
                    itemCount: listInvoice.length,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(indent: 2, endIndent: 2);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Builder(
                        builder: (context) {
                          return CardInvoiceClient(
                            type: '',
                            invoice: listInvoice[index],
                          );
                        },
                      );
                    },
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
