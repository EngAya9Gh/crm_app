import 'package:crm_smart/core/common/enums/devices_state_enum.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/invoiceModel.dart';

class PrepareButton extends StatelessWidget {
  final InvoiceModel invoice;

  const PrepareButton({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    final invoiceVm = context.read<InvoiceVm>();
    return Expanded(
      child: CustomButton(
        text: _getTitle(),
        onTap: () {
          // invoiceVm.changeDeviceState(_getNewDeviceState());
          // TODO: implement onTap
        },
      ),
    );
  }

  String _getTitle() {
    if (invoice.deviceState == DevicesStateEnum.prepare.name) {
      return 'تم تأمين الأجهزة';
    }
    return 'البدء بتحضير الأجهزة';
  }

  String _getNewDeviceState() {
    if (invoice.deviceState == DevicesStateEnum.prepare.name) {
      return DevicesStateEnum.ready.name;
    }
    return DevicesStateEnum.prepare.name;
  }
}
