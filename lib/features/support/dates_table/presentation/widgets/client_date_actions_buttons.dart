import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/dialog_ready.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/set_ready_install_date_button.dart';
import 'package:crm_smart/features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/custom_done_install_button.dart';

class ClientDateActionsButtons extends StatelessWidget {
  const ClientDateActionsButtons({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    final PrivilegeCubit _privilegeCubit = context.read<PrivilegeCubit>();
    return BlocBuilder<SupportTabCubit, SupportTabState>(
      builder: (context, state) {
        return Column(
          key: UniqueKey(),
          children: [
            if (context.read<PrivilegeCubit>().checkPrivilege('43') &&
                invoiceModel.dateinstall_done == null) ...[
              CustomDoneInstallButton(invoiceModel: invoiceModel)
            ],
            if (invoiceModel.dateinstall_done == null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_privilegeCubit.checkPrivilege('109')) ...[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
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
                  if (_privilegeCubit.checkPrivilege('151')) ...[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0, right: 3),
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
              )
            ],
            if (invoiceModel.dateinstall_done == null &&
                (_privilegeCubit.checkPrivilege('110') ||
                    _privilegeCubit.checkPrivilege('152'))) ...[
              SetReadyInstallDateButton(invoiceModel: invoiceModel),
            ],
          ],
        );
      },
    );
  }
}
