import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/receive_device_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class ReceiveDeviceState extends StatelessWidget {
  const ReceiveDeviceState({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SupportTabCubit, SupportTabState>(
        builder: (context, state) {
          return AppElevatedButton(
            isLoading: state.setReadyInstallStatus.isLoading,
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
                            final receiveParams = ReceiveDeviceParams(
                              id_invoice: invoiceModel.idInvoice.toString(),
                              deviceState: DevicesStateEnum.receive.name,
                            );

                            await context
                                .read<SupportTabCubit>()
                                .receiveDevice(receiveParams);

                            //   final InvoiceModel? invoice =
                            //       await invoiceVm.changeDeviceState(
                            //     idInvoice: invoiceModel.idInvoice!,
                            //     deviceState: DevicesStateEnum.receive.name,
                            //   );
                            //   if (invoice != null) {
                            //     invoiceVm.setCurrentInvoice(invoice);
                            //   }
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
