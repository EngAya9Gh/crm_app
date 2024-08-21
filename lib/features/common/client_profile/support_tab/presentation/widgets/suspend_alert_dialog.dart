import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/reason_suspend.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class SuspendAlertDialog extends StatefulWidget {
  const SuspendAlertDialog({
    super.key,
    required this.invoiceModel,
    required this.typeReady,
    required this.notesController,
    required this.formKey,
  });

  final InvoiceModel invoiceModel;
  final String typeReady;
  final GlobalKey<FormState> formKey;
  final TextEditingController notesController;

  @override
  State<SuspendAlertDialog> createState() => _SuspendAlertDialogState();
}

class _SuspendAlertDialogState extends State<SuspendAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text('التأكيد'),
        content: Text('هل تريد تحويل العميل لمعلق'),
        actions: <Widget>[
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AppElevatedButton(
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
                            final reasonSuspend = Provider.of<reason_suspend>(
                              context,
                              listen: false,
                            ).selectedValuemanag;
                            if (reasonSuspend?.isEmpty ?? true) {
                              AppConstants.showSnakeBar(
                                'من فضلك اختر سبب من القائمة ',
                              );
                              return;
                            }
                            if (!widget.formKey.currentState!.validate())
                              return;

                            final currentUser =
                                context.read<UserProvider>().currentUser;

                            final setReadyInstallParams = SetReadyInstallParams(
                              idInvoice:
                                  widget.invoiceModel.idInvoice.toString(),
                              TypeReadyClient: 'suspend',
                              notesReady: widget.notesController.text,
                              reasonSuspend: reasonSuspend,
                              dateNotReadyInstall: DateTime.now().toString(),
                              readyInstall: '0',
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
              ),
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
