import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_manual_task_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/section_with_action.dart';
import '../../../../../../core/common/widgets/add_action_button.dart';
import '../../../../../../core/common/widgets/action_menu_item.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/card_expansion.dart';
import '../../../../../../ui/widgets/support_attachments_row.dart';
import '../../../../../../view_model/datetime_vm.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../../../../sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../../../task_management/presentation/manager/task_cubit.dart';
import '../../../../../task_management/presentation/widgets/add_manual_task_button.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
import 'add_date_dialog.dart';
import 'client_date_actions_buttons.dart';
import 'client_support_card_details.dart';
import 'ReturnInvoiceForApprove.dart';
import 'cancel_date_dialog.dart';
import 'custom_done_install_button.dart';
import 'dialog_ready.dart';
import 'receive_device_state.dart';
import 'set_ready_install_date_button.dart';

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
  late PrivilegesCubit _privilegeCubit;
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
    _privilegeCubit = getIt<PrivilegesCubit>();
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
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            child: buildcardExpansion(
              "فاتورة  ${_invoice!.date_approve.toString()}  # ${_invoice!.idInvoice}",
              '',
              Column(
                children: [
                  // Tasks Section
                  SectionWithAction(
                    title: 'المهام',
                    onAddPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => AddManualTaskPage(
                          list: PublicType.values,
                          invoiceId: widget.idInvoice,
                        ),
                      );
                    },
                    child: Container(),
                  ),

                  // Attachments Section
                  SectionWithAction(
                    title: 'المرفقات',
                    onAddPressed: () {},
                    child: SupportAttachmentsRow(
                      idInvoice: widget.idInvoice!,
                    ),
                  ),

                  // Installation Details Section
                  SectionWithAction(
                    title: 'تفاصيل التركيب',
                    onAddPressed: () => _showActionMenu(context),
                    child: Column(
                      children: [
                        ClientSupportCardDetails(
                          invoiceModel: _invoice,
                          datesInstallation: datesInstallation,
                          list_installation_type: list_installation_type,
                          nextInstallation: nextInstallation,
                          selectInstallationType: selectInstallationType,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showActionMenu(BuildContext context) {
    final PrivilegesCubit _privilegeCubit = context.read<PrivilegesCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                if (_privilegeCubit.checkPrivilege('42'))
                  ActionMenuItem(
                    title: 'إضافة موعد التركيب والتدريب',
                    icon: Icons.add_alarm,
                    onTap: () async {
                      Navigator.pop(context);
                      await showDialog<void>(
                        context: context,
                        builder: (context) {
                          return AddDateDialog(
                            invoiceModel: _invoice!,
                            idClient: widget.idClient!,
                            datesInstallation: datesInstallation,
                          );
                        },
                      );
                    },
                  ),
                if (_privilegeCubit.checkPrivilege("43"))
                  ActionMenuItem(
                    title: 'تم التركيب',
                    icon: Icons.check_circle,
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            CustomDoneInstallButton(invoiceModel: _invoice!),
                      );
                    },
                  ),
                if (_privilegeCubit.checkPrivilege("196") &&
                    _invoice!.isApprove != null &&
                    _invoice!.isdoneinstall == null)
                  ActionMenuItem(
                    title: 'ارجاع العميل للاعتماد',
                    icon: Icons.replay,
                    onTap: () async {
                      Navigator.pop(context);
                      if (_invoice!.ready_install != '0') {
                        await showDialog(
                          context: context,
                          builder: (context) => ReturnInvoiceApprove(
                            invoiceModel: _invoice!,
                          ),
                        );
                      }
                    },
                  ),
                if (_privilegeCubit.checkPrivilege("151"))
                  ActionMenuItem(
                    title: 'غير جاهز',
                    icon: Icons.cancel,
                    onTap: () async {
                      Navigator.pop(context);
                      if (_invoice!.ready_install != '0') {
                        await showDialog(
                          context: context,
                          builder: (context) => DialogReady(
                            type_ready: 'notReady',
                            invoice: _invoice!,
                          ),
                        );
                      }
                    },
                  ),
                if (_privilegeCubit.checkPrivilege("109"))
                  ActionMenuItem(
                    title: 'تعليق التركيب',
                    icon: Icons.pause_circle,
                    onTap: () async {
                      Navigator.pop(context);
                      if (_invoice!.ready_install != '0') {
                        await showDialog(
                          context: context,
                          builder: (context) => DialogReady(
                            type_ready: 'suspend',
                            invoice: _invoice!,
                          ),
                        );
                      }
                    },
                  ),
                if (_privilegeCubit.checkPrivilege("110") ||
                    _privilegeCubit.checkPrivilege("152"))
                  ActionMenuItem(
                    title: 'تحديد موعد التركيب',
                    icon: Icons.calendar_today,
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            SetReadyInstallDateButton(invoiceModel: _invoice!),
                      );
                    },
                  ),
                if (_privilegeCubit.checkPrivilege("192") &&
                    _invoice!.hasDevices == true &&
                    _invoice!.deviceState == 'ready')
                  ActionMenuItem(
                    title: 'استلام الأجهزة',
                    icon: Icons.devices,
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            ReceiveDeviceState(invoiceModel: _invoice!),
                      );
                    },
                  ),
                ActionMenuItem(
                  title: 'تحديد نوع الاقرار',
                  icon: Icons.description,
                  onTap: () async {
                    Navigator.pop(context);
                    await showDialog(
                      context: context,
                      builder: (context) => AppDialog(
                        title: 'اختر نوع الاقرار',
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: AppText(
                                    'اقرار مشروع تركيب',
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryMain,
                                  ),
                                  onTap: () async {
                                    await HelperFunctions.urlLauncher(
                                      '${EndPoints.baseUrls.urlTrainingMulti}?fk_invoice=${_invoice!.idInvoice}',
                                      isNewTab: true,
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  child: AppText(
                                    'اقرار تدريب',
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryMain,
                                  ),
                                  onTap: () async {
                                    await HelperFunctions.urlLauncher(
                                      '${EndPoints.baseUrls.urlTrainingMulti}?fk_invoice=${_invoice!.idInvoice}&type=training',
                                      isNewTab: true,
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  child: AppText(
                                    'اقرار تركيب',
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryMain,
                                  ),
                                  onTap: () async {
                                    await HelperFunctions.urlLauncher(
                                      '${EndPoints.baseUrls.urlTrainingMulti}?fk_invoice=${_invoice!.idInvoice}&type=install',
                                      isNewTab: true,
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  child: AppText(
                                    'اقرار تركيب وتدريب',
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryMain,
                                  ),
                                  onTap: () async {
                                    await HelperFunctions.urlLauncher(
                                      '${EndPoints.baseUrls.urlTrainingMulti}?fk_invoice=${_invoice!.idInvoice}&type=both',
                                      isNewTab: true,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
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
