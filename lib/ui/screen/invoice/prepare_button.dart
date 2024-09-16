import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/devices_state_enum.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';

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
        if (vm.isloading) return AppLoader();
        return AppElevatedButton(
          text: _getTitle(),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    title: AppText('تأكيد'),
                    content: AppText('هل تريد تغيير حالة الأجهزة؟'),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      AppElevatedButton(
                        text: 'تأكيد',
                        onPressed: () async {
                          AppNavigator.pop();
                          await invoiceVm.changeDeviceState(
                            idInvoice: currentInvoice.idInvoice!,
                            deviceState: _getNewDeviceState(),
                          );
                        },
                      ),
                      AppElevatedButton(
                        text: 'إلغاء',
                        onPressed: () => AppNavigator.pop(),
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
