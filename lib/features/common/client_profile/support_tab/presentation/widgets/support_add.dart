import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/card_expansion.dart';
import '../../../../../../ui/widgets/support_attachments_row.dart';
import '../../../../../../view_model/datetime_vm.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../../../../sales/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../../../task_management/presentation/manager/task_cubit.dart';
import '../../../../../task_management/presentation/widgets/add_manual_task_button.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
import 'add_date_dialog.dart';
import 'client_date_actions_buttons.dart';
import 'client_support_card_details.dart';

class SupportAdd extends StatefulWidget {
  const SupportAdd({
    super.key,
    required this.idInvoice,
    required this.idClient,
  });

  final String? idInvoice;
  final String? idClient;

  @override
  State<SupportAdd> createState() => _SupportAddState();
}

class _SupportAddState extends State<SupportAdd> {
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
  late final InvoiceVm invoiceVm;
  late final ClientsListBloc clientsListBloc;
  DateInstallationClient? nextInstallation;

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
    invoiceVm = context.read<InvoiceVm>();

    _invoice = context
        .read<SupportTabCubit>()
        .listInvoiceClientSupport
        .firstWhere((element) => element.idInvoice == widget.idInvoice);

    datesInstallation = List<DateInstallationClient>.of(
        _invoice?.datesInstallationClient ?? []);

    final listDates = List<DateInstallationClient>.of(datesInstallation);
    listDates.sort((a, b) => a.dateClientVisit!.compareTo(b.dateClientVisit!));
    nextInstallation = listDates.firstWhereOrNull(
        (element) => element.isDone == "0" || element.isDone == '3');

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
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
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
                    ClientDateActionsButtons(invoiceModel: _invoice!),
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
