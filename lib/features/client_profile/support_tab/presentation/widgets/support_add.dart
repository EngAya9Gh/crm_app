import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/widgets/client_support_card_details.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/widgets/dialog_ready.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import 'package:crm_smart/features/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/add_manual_task_button.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/ui/widgets/support_attachments_row.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../view_model/invoice_vm.dart';
import 'add_date_dialog.dart';

class NewSupportAdd extends StatefulWidget {
  const NewSupportAdd({
    super.key,
    required this.idInvoice,
    required this.idClient,
  });

  final String? idInvoice;
  final String? idClient;

  @override
  State<NewSupportAdd> createState() => _NewSupportAddState();
}

class _NewSupportAddState extends State<NewSupportAdd> {
  TextEditingController _textsupport = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _endtimeController = TextEditingController();
  late PrivilegeCubit _privilegeCubit;
  late final SupportTabCubit supportTabCubit;

  late InvoiceModel? _invoice = null;
  String? fk_client;
  bool valueresoan = false;

  List<String> list_installation_type = [
    'ميداني',
    'اونلاين',
  ];
  late String? selectInstallationType;
  String? Value_installation_type = null;
  late final invoice_vm invoiceVm;
  late final ClientsListBloc clientsListBloc;

  @override
  void dispose() {
    _textsupport.dispose();
    _timeController.dispose();
    _endtimeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    supportTabCubit = context.read<SupportTabCubit>();
    _privilegeCubit = getIt<PrivilegeCubit>();
    clientsListBloc = context.read<ClientsListBloc>();
    invoiceVm = context.read<invoice_vm>();

    _invoice = context
        .read<SupportTabCubit>()
        .listinvoiceClientSupport
        .firstWhere((element) => element.idInvoice == widget.idInvoice);

    datesInstallation = List<DateInstallationClient>.of(
        _invoice?.datesInstallationClient ?? []);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      clientsListBloc
          .add(GetClientSupportFilesEvent(GetClientSupportFilesParams(
        invoiceId: widget.idInvoice!,
      )));
    });
    selectInstallationType = null;
    super.initState();
  }

  List<DateInstallationClient> datesInstallation = [];

  @override
  Widget build(BuildContext context) {
    final listDates = List<DateInstallationClient>.of(datesInstallation);
    listDates.sort((a, b) => a.dateClientVisit!.compareTo(b.dateClientVisit!));
    final nextInstallation = listDates.firstWhereOrNull(
        (element) => element.isDone == "0" || element.isDone == '3');

    return SafeArea(
      child: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildcardExpansion(
              "فاتورة  ${_invoice!.date_approve}  # ${_invoice!.idInvoice}",
              '',
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    AddManualTaskButton(
                      list: supportPublicTypeList,
                      invoiceId: widget.idInvoice,
                    ),
                    // attachments
                    SupportAttachmentsRow(
                      idInvoice: widget.idInvoice!,
                    ),
                    SizedBox(height: 20),
                    // add date install
                    if (_privilegeCubit.checkPrivilege('42')) ...[
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kMainColor)),
                        onPressed: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (context) {
                              return AddDateDialog(
                                list_installation_type: list_installation_type,
                                invoiceModel: _invoice!,
                                idClient: widget.idClient!,
                                datesInstallation: datesInstallation,
                              );
                            },
                          );
                        },
                        child: Text('إضافة موعد التركيب والتدريب'),
                      )
                    ],

                    SizedBox(height: 20),
                    ClientSupportCardDetails(
                      invoiceModel: _invoice,
                      datesInstallation: datesInstallation,
                      list_installation_type: list_installation_type,
                      nextInstallation: nextInstallation,
                      selectInstallationType: selectInstallationType,
                    ),
                    _invoice!.dateinstall_done != null
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _privilegeCubit.checkPrivilege('109')
                                  ? Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 3.0),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kMainColor),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      context
                                                          .colorScheme.white),
                                            ),
                                            onPressed:
                                                _invoice!.ready_install == '0'
                                                    ? null
                                                    : () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              DialogReady(
                                                            type_ready:
                                                                'suspend',
                                                            invoice: _invoice!,
                                                          ),
                                                        );
                                                      },
                                            child: Text('تعليق التركيب')),
                                      ),
                                    )
                                  : Container(),
                              _privilegeCubit.checkPrivilege('151')
                                  ? Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 3.0, right: 3),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kMainColor),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      context
                                                          .colorScheme.white),
                                            ),
                                            onPressed:
                                                _invoice!.ready_install == '0'
                                                    ? null
                                                    : () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              DialogReady(
                                                            type_ready:
                                                                'notReady',
                                                            invoice: _invoice!,
                                                          ),
                                                        );
                                                        //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
                                                      },
                                            child: Text('غير جاهز')),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                    if (_invoice!.dateinstall_done == null &&
                        (_privilegeCubit.checkPrivilege('110') ||
                            _privilegeCubit.checkPrivilege('152')))
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kMainColor),
                              foregroundColor: MaterialStateProperty.all(
                                  context.colorScheme.white),
                            ),
                            onPressed: _invoice!.ready_install == '1'
                                ? null
                                : () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ModalProgressHUD(
                                          inAsyncCall: Provider.of<invoice_vm>(
                                                  context,
                                                  listen: true)
                                              .isloadingdone,
                                          child: Directionality(
                                            textDirection:
                                                myui.TextDirection.rtl,
                                            child: AlertDialog(
                                              title: Text('التأكيد'),
                                              content: Text(
                                                  'هل تريد الغاء تعليق العميل '),
                                              actions: <Widget>[
                                                Column(
                                                  children: [
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                            kMainColor)),
                                                            onPressed: () {
                                                              AppNavigator
                                                                  .pop();
                                                            },
                                                            child: Text('لا'),
                                                          ),
                                                        ),
                                                        20.horizontalSpace,
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                            kMainColor)),
                                                            onPressed:
                                                                () async {
                                                              Provider.of<invoice_vm>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setisload();

                                                              await Provider.of<
                                                                          invoice_vm>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .set_ready_install(
                                                                      {
                                                                    'date_temp':
                                                                        _invoice!
                                                                            .date_not_readyinstall
                                                                            .toString(),
                                                                    'date_ready_prev':
                                                                        _invoice!
                                                                            .date_readyinstall
                                                                            .toString(),
                                                                    'date_readyinstall':
                                                                        DateTime.now()
                                                                            .toString(),
                                                                    'user_ready_install': Provider.of<UserProvider>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .currentUser
                                                                        .idUser
                                                                        .toString(),
                                                                    'ready_install':
                                                                        '1',
                                                                  },
                                                                      _invoice!
                                                                          .idInvoice).then(
                                                                      (value) {
                                                                return clear();
                                                              });
                                                              AppNavigator
                                                                  .pop();
                                                            },
                                                            child: Text('نعم'),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                            child: Text('الغاء تعليق العميل')),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TimeOfDay endTime = TimeOfDay(hour: -1, minute: 00);

  clear() {
    endTime = TimeOfDay(hour: -1, minute: 00);
    if (context.mounted)
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    selectInstallationType = null;
    Value_installation_type = null;
  }
}
