import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../support/dates_table/presentation/manager/dates_table_cubit.dart';
import 'ReturnInvoiceForApprove.dart';
import 'cancel_date_dialog.dart';
import 'custom_done_install_button.dart';
import 'dialog_ready.dart';
import 'receive_device_state.dart';
import 'set_ready_install_date_button.dart';

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
              children: [
                if (_isAllowed(context, ["43"])) ...[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CustomDoneInstallButton(invoiceModel: invoiceModel),
                  ))
                ],
                if (_isAllowedToReturnUserToWaiting(_privilegeCubit)) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                        text: "ارجاع العميل للانتظار",
                        isDisabled: invoiceModel.isdoneinstall != '1',
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return CancelDateDialog(
                                idInvoice: invoiceModel.idInvoice!,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_privilegeCubit.checkPrivilege("196") &&
                    invoiceModel.isApprove != null &&
                    invoiceModel.isdoneinstall == null) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                        appButtonStyle: AppButtonStyle.secondary,
                        text: 'ارجاع العميل للاعتماد',
                        isDisabled: invoiceModel.ready_install == '0',
                        onPressed: invoiceModel.ready_install == '0'
                            ? null
                            : () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => ReturnInvoiceApprove(
                                    invoiceModel: invoiceModel,
                                  ),
                                );
                              },
                      ),
                    ),
                  ),
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
                        appButtonStyle: AppButtonStyle.secondary,
                        text: 'تعليق التركيب',
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
                      ),
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
                        invoiceModel.hasDevices == true &&
                        invoiceModel.deviceState ==
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

  bool _isAllowedToReturnUserToWaiting(PrivilegeCubit _privilegeCubit) {
    return _privilegeCubit.checkPrivilege("200");
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
