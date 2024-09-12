import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../finance_pending/presentation/manager/finance_pending_cubit.dart';
import '../../../pending_invoices/presentation/manager/pending_invoices_cubit.dart';
import '../manager/clients_list_bloc.dart';
import 'approve_refuse_transfer_client_button.dart';

class ClientInfoButtons extends StatefulWidget {
  const ClientInfoButtons({
    super.key,
    required this.idClient,
    required this.client,
    this.invoice,
    this.typeInvoice,
    this.clientTransfer,
  });

  final String idClient;
  final ClientModel client;
  final InvoiceModel? invoice;
  final String? typeInvoice;
  final String? clientTransfer;

  @override
  State<ClientInfoButtons> createState() => _ClientInfoButtonsState();
}

class _ClientInfoButtonsState extends State<ClientInfoButtons> {
  late ClientModel client;

  @override
  void initState() {
    client = widget.client;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientsListBloc, ClientsListState>(
      buildWhen: (previous, current) {
        return current.receiveClientStatus.isSuccess() &&
            previous.receiveClientStatus != current.receiveClientStatus;
      },
      listener: (context, state) {
        if (state.receiveClientStatus.isSuccess()) {
          client = state.receiveClientStatus.data!;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            if (_isAllowedTransfer(context))
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ApproveRefuseTransferClientButton(
                      title: 'قبول تحويل العميل',
                      idClient: widget.idClient,
                      clientModel1: client,
                      color: AppColors.primaryColor,
                      approve: '1',
                    ),
                    SizedBox(width: 10),
                    ApproveRefuseTransferClientButton(
                      title: 'رفض تحويل العميل',
                      idClient: widget.idClient,
                      clientModel1: client,
                      color: Colors.redAccent,
                      approve: '0',
                    ),
                  ],
                ),
              ),
            widget.invoice != null
                ? widget.invoice!.isApprove == null
                    ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AppElevatedButton(
                                text: 'Approve',
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ModalProgressHUD(
                                        inAsyncCall:
                                            Provider.of<InvoiceVm>(context)
                                                .isapproved,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: AlertDialog(
                                            titlePadding:
                                                const EdgeInsets.fromLTRB(
                                                    24.0, 10.0, 24.0, 15.0),
                                            insetPadding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            contentPadding: EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                                bottom: 10),
                                            title: Center(
                                                child: AppText('Confirmation')),
                                            content: AppText(
                                                ' هل تريد تأكيد العملية؟  '),
                                            actions: <Widget>[
                                              AppElevatedButton(
                                                text: 'نعم',
                                                onPressed: () async {
                                                  _setApproveClient(
                                                    context: context,
                                                    invoice: widget.invoice!,
                                                    isApprove: '1',
                                                  );
                                                },
                                              ),
                                              AppElevatedButton(
                                                text: 'لا',
                                                onPressed: () {
                                                  AppNavigator.pop(
                                                      result: false);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  //Navigator.pop(context);
                                },
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: AppElevatedButton(
                                text: 'Refuse',
                                backgroundColor: Colors.redAccent,
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ModalProgressHUD(
                                        inAsyncCall:
                                            Provider.of<InvoiceVm>(context)
                                                .isapproved,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: AlertDialog(
                                            titlePadding:
                                                const EdgeInsets.fromLTRB(
                                                    24.0, 10.0, 24.0, 15.0),
                                            insetPadding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            contentPadding: EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                                bottom: 10),
                                            title: Center(
                                                child: AppText('Confirmation')),
                                            content: AppText(
                                                ' هل تريد تأكيد العملية؟  '),
                                            actions: <Widget>[
                                              AppElevatedButton(
                                                text: 'نعم',
                                                onPressed: () async {
                                                  _setApproveClient(
                                                    context: context,
                                                    invoice: widget.invoice!,
                                                    isApprove: '0',
                                                  );
                                                },
                                              ),
                                              AppElevatedButton(
                                                text: 'لا',
                                                onPressed: () {
                                                  AppNavigator.pop(
                                                      result: false);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  //send notification
                                  //Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : IgnorePointer()
                : IgnorePointer(),
            if (widget.invoice != null)
              widget.invoice!.isApprove != 1 &&
                      widget.invoice!.isApproveFinance == null &&
                      Provider.of<PrivilegesCubit>(context, listen: true)
                              .checkPrivilege('111') ==
                          true &&
                      widget.typeInvoice == 'f'
                  ? Center(
                      child: AppElevatedButton(
                      text: 'Approve',
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return ModalProgressHUD(
                              inAsyncCall:
                                  Provider.of<InvoiceVm>(context).isapproved,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  titlePadding: const EdgeInsets.fromLTRB(
                                      24.0, 10.0, 24.0, 15.0),
                                  insetPadding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  contentPadding: EdgeInsets.only(
                                      left: 24, right: 24, bottom: 10),
                                  title: Center(child: AppText('Confirmation')),
                                  content: AppText(' هل تريد تأكيد العملية؟  '),
                                  actions: <Widget>[
                                    AppElevatedButton(
                                      text: 'نعم',
                                      onPressed: () async {
                                        Provider.of<InvoiceVm>(context,
                                                listen: false)
                                            .setApproveFclient_vm({
                                          "id_clients":
                                              widget.invoice!.fkIdClient,
                                          //'idApproveClient':widget.itemapprove!.idApproveClient,
                                          'Date_FApprove':
                                              DateTime.now().toString(),
                                          "fk_user": widget.invoice!.fkIdUser,
                                          //صاحب العميل
                                          "fk_regoin":
                                              widget.invoice!.fk_regoin,
                                          "regoin": widget.invoice!.name_regoin,
                                          "fk_country":
                                              widget.invoice!.fk_country,
                                          "isApproveFinance": "1",
                                          "name_enterprise":
                                              widget.invoice!.name_enterprise,
                                          "fkusername":
                                              widget.invoice!.nameUser,
                                          //موظف المبيعات
                                          //"message":"",//
                                          "nameuserApproved":
                                              Provider.of<UserProvider>(context,
                                                      listen: false)
                                                  .currentUser
                                                  .nameUser,
                                          "iduser_FApprove":
                                              Provider.of<UserProvider>(context,
                                                      listen: false)
                                                  .currentUser
                                                  .idUser
                                        }, widget.invoice!.idInvoice).then(
                                                (value) {
                                          context
                                              .read<FinancePendingCubit>()
                                              .removeApprovedInvoice(
                                                  widget.invoice!.idInvoice!);
                                          return value != false
                                              ? clear()
                                              : error();
                                        } // clear()
                                                );
                                      },
                                    ),
                                    AppElevatedButton(
                                      text: 'لا',
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(
                                                false); // dismisses only the dialog and returns false
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                        //Navigator.pop(context);
                      },
                    ))
                  : IgnorePointer()
          ],
        );
      },
    );
  }

  void _setApproveClient({
    required BuildContext context,
    required InvoiceModel invoice,
    required String isApprove,
  }) {
    Provider.of<InvoiceVm>(context, listen: false).setApproveclient_vm({
      "isApprove": isApprove,
    }, widget.invoice!.idInvoice).then((value) {
      context
          .read<PendingInvoicesCubit>()
          .removeApprovedInvoice(widget.invoice!.idInvoice!);
      return value != false ? clear() : error();
    });
  }

  bool _isAllowedTransfer(BuildContext context) {
    return ((widget.clientTransfer != null &&
            context.read<PrivilegesCubit>().checkPrivilege('183') == true)) ||
        (client.transferTo ==
                Provider.of<UserProvider>(context, listen: false)
                    .currentUser
                    .idUser
                    .toString() &&
            widget.clientTransfer != null);
  }

  clear() {
    AppNavigator.pop();
    AppNavigator.pop();
  }

  error() {
    AppNavigator.pop();
    AppNavigator.pop();
  }
}
