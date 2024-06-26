import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/devices_state_enum.dart';
import '../../../core/common/widgets/app_elvated_button.dart';
import '../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../widgets/custom_widget/custombutton.dart';

class PrepareButton extends StatefulWidget {
  const PrepareButton({super.key});

  @override
  State<PrepareButton> createState() => _PrepareButtonState();
}

class _PrepareButtonState extends State<PrepareButton> {
  late final InvoiceVm invoiceVm;
  late InvoiceModel currentInvoice;

  @override
  void initState() {
    invoiceVm = context.read<InvoiceVm>();
    currentInvoice = invoiceVm.currentInvoice!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final invoiceVm = context.read<InvoiceVm>();
    return Consumer<InvoiceVm>(
      builder: (context, vm, child) {
        if (vm.isloading) return CustomLoadingIndicator();
        return CustomButton(
          text: _getTitle(),
          onTap: () {
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
                          await invoiceVm.changeDeviceState(
                            idInvoice: currentInvoice.idInvoice!,
                            deviceState: _getNewDeviceState(),
                          );
                        },
                        child: Text('تأكيد'),
                      ),
                      AppElevatedButton(
                        onPressed: () => AppNavigator.pop(),
                        child: Text('إلغاء'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  String _getTitle() {
    if (invoiceVm.currentInvoice!.deviceState ==
        DevicesStateEnum.prepare.name) {
      return 'تم تأمين الأجهزة';
    }
    return 'البدء بتحضير الأجهزة';
  }

  String _getNewDeviceState() {
    if (invoiceVm.currentInvoice!.deviceState ==
        DevicesStateEnum.prepare.name) {
      return DevicesStateEnum.ready.name;
    }
    return DevicesStateEnum.prepare.name;
  }
}
