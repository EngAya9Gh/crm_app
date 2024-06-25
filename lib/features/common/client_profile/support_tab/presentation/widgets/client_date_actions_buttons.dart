import '../../../../../../core/common/enums/devices_state_enum.dart';
import 'dialog_ready.dart';
import 'set_ready_install_date_button.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../support/dates_table/presentation/manager/dates_table_cubit.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/widgets/app_elvated_button.dart';
import 'custom_done_install_button.dart';
import 'receive_device_state.dart';

class ClientDateActionsButtons extends StatelessWidget {
  const ClientDateActionsButtons({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    final PrivilegeCubit _privilegeCubit = context.read<PrivilegeCubit>();
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      builder: (context, state) {
        return Column(
          key: UniqueKey(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isAllowed(context, ["43"])) ...[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CustomDoneInstallButton(invoiceModel: invoiceModel),
                  ))
                ],
                if (_isAllowed(context, ["151"])) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                          isDisabled: invoiceModel.ready_install == '0',
                          onPressed: invoiceModel.ready_install == '0'
                              ? null
                              : () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => DialogReady(
                                      type_ready: 'notReady',
                                      invoice: invoiceModel,
                                    ),
                                  );
                                  //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
                                },
                          child: Text('غير جاهز')),
                    ),
                  )
                ],
              ],
            ),
            Row(
              children: [
                if (_isAllowed(context, ["109"])) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                          isDisabled: invoiceModel.ready_install == '0',
                          onPressed: invoiceModel.ready_install == '0'
                              ? null
                              : () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => DialogReady(
                                      type_ready: 'suspend',
                                      invoice: invoiceModel,
                                    ),
                                  );
                                },
                          child: Text('تعليق التركيب')),
                    ),
                  ),
                ],
                if (_isAllowed(context, ["110", "152"])) ...[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child:
                        SetReadyInstallDateButton(invoiceModel: invoiceModel),
                  )),
                ],
              ],
            ),
            Row(
              children: [
                Consumer<InvoiceVm>(
                  builder: (context, invVm, child) {
                    if (_privilegeCubit.checkPrivilege("192") &&
                        invVm.currentInvoice?.deviceState ==
                            DevicesStateEnum.ready.name) {
                      return ReceiveDeviceState(invoiceModel: invoiceModel);
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  bool _isAllowed(BuildContext context, List<String> privileges) {
    if (invoiceModel.dateinstall_done != null) return false;

    for (var item in privileges) {
      if (!context.read<PrivilegeCubit>().checkPrivilege(item)) {
        return false;
      }
    }
    return true;
  }
}
