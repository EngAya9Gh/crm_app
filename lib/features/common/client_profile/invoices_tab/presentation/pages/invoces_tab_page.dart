import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/card_invoice_client.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../ui/screen/invoice/addInvoice.dart';
import '../../../../../../ui/widgets/custom_widget/custombutton.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';

class InvoicesTabPage extends StatefulWidget {
  const InvoicesTabPage({
    super.key,
    required this.client,
  });

  final ClientModel client;

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
                AppNavigator.go(
                  AddInvoice(itemClient: widget.client),
                  isNew: false,
                );
              },
            ),
            Expanded(
              child: Consumer<InvoiceVm>(
                builder: (context, value, child) {
                  final listInvoice = value.listInvoiceClient;

                  final isLoading = value.isLoadingInvoicesClientLocal;

                  if (isLoading) {
                    return AppLoader();
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
