import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/section_with_action.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../ui/screen/invoice/addInvoice.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../widgets/modern_invoice_card.dart';

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
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            SectionWithAction(
              title: 'الفواتير',
              onAddPressed: () async {
                AppNavigator.go(
                  AddInvoice(itemClient: widget.client),
                  isNew: false,
                );
              },
              child: Consumer<InvoiceVm>(
                builder: (context, value, child) {
                  final listInvoice = value.listInvoiceClient;
                  final isLoading = value.isLoadingInvoicesClientLocal;

                  if (isLoading) {
                    return SizedBox(
                      height: 100,
                      child: Center(child: AppLoader()),
                    );
                  }

                  if (listInvoice.isEmpty) {
                    return SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'لا توجد فواتير',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.scaleFontSize,
                          ),
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8),
                      itemCount: listInvoice.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: ModernInvoiceCard(
                            invoice: listInvoice[index],
                            type: '',
                            routeName: AppRoutesNames
                                .salesInternalRoutes.invoiceDetails,
                          ),
                        );
                      },
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
