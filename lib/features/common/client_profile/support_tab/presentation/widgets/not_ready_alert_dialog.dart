import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/reason_suspend.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class NotReadyAlertDialog extends StatefulWidget {
  const NotReadyAlertDialog({
    super.key,
    required this.invoiceModel,
    required this.typeReady,
    required this.formKey,
    required this.notesController,
  });

  final InvoiceModel invoiceModel;
  final String typeReady;
  final GlobalKey<FormState> formKey;
  final TextEditingController notesController;

  @override
  State<NotReadyAlertDialog> createState() => _NotReadyAlertDialogState();
}

class _NotReadyAlertDialogState extends State<NotReadyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text('التأكيد'),
        content: Text('هل تريد تحويل العميل إلى غير جاهز للتركيب '),
        actions: <Widget>[
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => AppNavigator.pop(),
                      child: Text('لا'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: BlocBuilder<SupportTabCubit, SupportTabState>(
                      buildWhen: (previous, current) =>
                          previous.setReadyInstallStatus !=
                          current.setReadyInstallStatus,
                      builder: (context, state) {
                        return AppElevatedButton(
                          isLoading: state.setReadyInstallStatus.isLoading,
                          onPressed: () async {
                            final reason = Provider.of<reason_suspend>(
                              context,
                              listen: false,
                            ).selectedValue_sales;

                            if (reason?.isEmpty ?? true) {
                              AppSnackbar.showSnakeBar(
                                'من فضلك اختر سبب من القائمة ',
                              );
                              return;
                            }

                            if (!widget.formKey.currentState!.validate())
                              return;

                            final setReadyInstallParams = SetReadyInstallParams(
                              idInvoice:
                                  widget.invoiceModel.idInvoice.toString(),
                              TypeReadyClient: 'notReady',
                              notesReady: widget.notesController.text,
                              reasonNotReady: reason,
                            );

                            await context
                                .read<SupportTabCubit>()
                                .setReadyInstall(setReadyInstallParams);

                            widget.notesController.clear();
                            AppNavigator.pop();
                          },
                          child: Text('نعم'),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.notesController.dispose();
    super.dispose();
  }
}
