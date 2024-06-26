import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/invoice_vm.dart';

class ReceiveDeviceState extends StatelessWidget {
  const ReceiveDeviceState({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<InvoiceVm>(
        builder: (context, invoiceVm, child) {
          return AppElevatedButton(
            isLoading: invoiceVm.isloading,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: Text('تأكيد'),
                      content: Text('هل تريد تغيير حالة الأجهزة؟'),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [
                        AppElevatedButton(
                          onPressed: () async {
                            AppNavigator.pop();
                            final InvoiceModel? invoice =
                                await invoiceVm.changeDeviceState(
                              idInvoice: invoiceModel.idInvoice!,
                              deviceState: DevicesStateEnum.receive.name,
                            );
                            if (invoice != null) {
                              invoiceVm.setCurrentInvoice(invoice);
                            }
                          },
                          child: Text('تأكيد'),
                        ),
                        AppElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('إلغاء'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('استلام الأجهزة'),
          );
        },
      ),
    );
  }
}
