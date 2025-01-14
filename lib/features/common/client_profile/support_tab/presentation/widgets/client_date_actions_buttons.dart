import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../support/dates_table/presentation/manager/dates_table_cubit.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
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
    final PrivilegesCubit _privilegeCubit = context.read<PrivilegesCubit>();
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      builder: (context, state) {
        InvoiceModel invoice=context
            .read<SupportTabCubit>()
            .listInvoiceClientSupport
            .firstWhere((element) => element.idInvoice == invoiceModel.idInvoice);
        return Column(
          key: UniqueKey(),
          children: [
            Row(
              children: [
                if (_isAllowed(context, ["43"])) ...[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CustomDoneInstallButton(invoiceModel: invoice),
                  ))
                ],
                if (_isAllowedToReturnUserToWaiting(_privilegeCubit)) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                        text: "ارجاع العميل للانتظار",
                        isDisabled: invoice.isdoneinstall != '1',
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return CancelDateDialog(
                                idInvoice: invoice.idInvoice!,
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
            5.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_privilegeCubit.checkPrivilege("196") &&
                    invoice.isApprove != null &&
                    invoice.isdoneinstall == null) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                        text: 'ارجاع العميل للاعتماد',
                        appButtonStyle: AppButtonStyle.secondary,
                        isDisabled: invoice.ready_install == '0',
                        onPressed: invoice.ready_install == '0'
                            ? null
                            : () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => ReturnInvoiceApprove(
                                    invoiceModel: invoice,
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
                        text: 'غير جاهز',
                        isDisabled: invoice.ready_install == '0',
                        onPressed: invoice.ready_install == '0'
                            ? null
                            : () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => DialogReady(
                                    type_ready: 'notReady',
                                    invoice: invoice,
                                  ),
                                );
                                //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
                              },
                      ),
                    ),
                  )
                ],
              ],
            ),
            5.height,
            Row(
              children: [
                if (_isAllowed(context, ["109"])) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: AppElevatedButton(
                        text: 'تعليق التركيب',
                        appButtonStyle: AppButtonStyle.secondary,
                        isDisabled: invoice.ready_install == '0',
                        onPressed: invoice.ready_install == '0'
                            ? null
                            : () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => DialogReady(
                                    type_ready: 'suspend',
                                    invoice: invoice,
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
                        SetReadyInstallDateButton(invoiceModel: invoice),
                  )),
                ],
              ],
            ),
            5.height,
            Row(
              children: [
                Consumer<InvoiceVm>(
                  builder: (context, invVm, child) {
                    if (_privilegeCubit.checkPrivilege("192") &&
                        invoice.hasDevices == true &&
                        invoice.deviceState ==
                            DevicesStateEnum.ready.name) {
                      return ReceiveDeviceState(invoiceModel: invoice);
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

  bool _isAllowedToReturnUserToWaiting(PrivilegesCubit _privilegeCubit) {
    return _privilegeCubit.checkPrivilege("200");
  }

  bool _isAllowed(BuildContext context, List<String> privileges) {
    InvoiceModel invoice=context
        .read<SupportTabCubit>()
        .listInvoiceClientSupport
        .firstWhere((element) => element.idInvoice == invoiceModel.idInvoice);
    if (invoice.dateinstall_done != null) return false;

    for (var item in privileges) {
      if (!context.read<PrivilegesCubit>().checkPrivilege(item)) {
        return false;
      }
    }
    return true;
  }
}
