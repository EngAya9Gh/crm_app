import 'dart:io';
import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/widgets/dialog_ready.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import 'package:crm_smart/features/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/add_manual_task_button.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:crm_smart/ui/widgets/support_attachments_row.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../view_model/invoice_vm.dart';
import 'add_date_dialog.dart';
import 'custom_done_install_button.dart';

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
  TextEditingController _textnameuserclient = TextEditingController();
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
    _textnameuserclient.dispose();
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

  File? selectedFile;

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
                'فاتورة  ' +
                    _invoice!.date_approve.toString() +
                    '      # ' +
                    _invoice!.idInvoice.toString(),
                '',
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
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
                      // BlocBuilder<ClientsListBloc, ClientsListState>(
                      //   builder: (context, state) {
                      //     return _attachmentWidget(
                      //         crudClientSupportFilesStatus: clientsListBloc
                      //             .state.getClientSupportFilesStatus);
                      //   },
                      // ),
                      // SizedBox(height: 20),
                      // BlocBuilder<ClientsListBloc, ClientsListState>(
                      //   builder: (context, state) {
                      //     if (state.getClientSupportFilesStatus.isLoading()) {
                      //       return CustomLoadingIndicator();
                      //     } else if (state.getClientSupportFilesStatus
                      //         .isFail()) {
                      //       return CustomErrorWidget(onPressed: () {
                      //         clientsListBloc.add(GetClientSupportFilesEvent(
                      //             GetClientSupportFilesParams(
                      //           invoiceId: widget.idInvoice!,
                      //         )));
                      //       });
                      //     } else if (state.clientSupportFilesList.isEmpty) {
                      //       return SizedBox.shrink();
                      //     }
                      //     return SizedBox(
                      //       height: 125,
                      //       child: ListView.separated(
                      //         itemBuilder: (context, index) {
                      //           final file =
                      //               state.clientSupportFilesList[index];
                      //           if (file.fileUrl.endsWith('.pdf')) {
                      //             return InkWell(
                      //               onTap: () {
                      //                 invoiceVm.deleteFileAttach(index);
                      //               },
                      //               child: PdfWithZoomIcon(
                      //                 fileUrl: EndPoints.baseUrls.urlfile + file.fileUrl,
                      //                 file: null,
                      //               ),
                      //             );
                      //           } else {
                      //             return networkImage(
                      //               FileAttach(
                      //                 id: file.id,
                      //                 fileAttach: file.fileUrl,
                      //               ),
                      //               () {
                      //                 clientsListBloc.add(
                      //                   CrudClientSupportFilesEvent(
                      //                     CrudClientSupportFilesParams(
                      //                       invoiceId: widget.idInvoice!,
                      //                       addedFiles: [],
                      //                       deletedFiles: [file.id],
                      //                     ),
                      //                     onSuccess: (value) {},
                      //                   ),
                      //                 );
                      //               },
                      //             );
                      //           }
                      //         },
                      //         separatorBuilder: (context, index) =>
                      //             10.horizontalSpace,
                      //         itemCount: state.clientSupportFilesList.length,
                      //         scrollDirection: Axis.horizontal,
                      //       ),
                      //     );
                      //   },
                      // ),

                      // ParticipatesSupportInvoicesAttachments(
                      //   onDeleteFileAttach: (FileAttach value) {},
                      // ),
                      SizedBox(height: 20),
                      _privilegeCubit.checkPrivilege('42')
                          // ? _invoice!.dateinstall_task != null && _invoice!.dateinstall_done == null
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kMainColor)),
                              onPressed: () async {
                                await showDialog<void>(
                                    context: context,
                                    builder: (context) => AddDateDialog(
                                          list_installation_type:
                                              list_installation_type,
                                          invoiceModel: _invoice!,
                                          idClient: widget.idClient!,
                                          datesInstallation: datesInstallation,
                                        ));
                              },
                              child: Text('إضافة موعد التركيب والتدريب'),
                            )
                          // : Container()
                          : Container(),

                      SizedBox(height: 20),
                      _invoice!.dateinstall_done == null
                          ? Container()
                          : CardRow(
                              title: ' تاريخ التركيب ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.dateinstall_done.toString()))),

                      _invoice!.dateinstall_done == null
                          ? Container()
                          : CardRow(
                              title: ' تم التركيب من قبل ',
                              value: getnameshort(
                                  _invoice!.nameuserinstall.toString())),

                      if (nextInstallation?.dateClientVisit != null)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => support_table()));
                          },
                          child: CardRow(
                              title: 'تاريخ الزيارة القادمة',
                              value: DateFormat('yyyy-MM-dd HH:mm')
                                  .format(nextInstallation!.dateClientVisit!)),
                        ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => support_table()));
                        },
                        child: CardRow(
                            title: 'عدد الزيارات التي تمت ',
                            value: datesInstallation
                                .where((element) => element.isDone == "1")
                                .length
                                .toString()),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => support_table()));
                        },
                        child: CardRow(
                            title: 'عدد الزيارات المتبقية',
                            value: datesInstallation
                                .where((element) =>
                                    element.isDone == "0" ||
                                    element.isDone == '3')
                                .length
                                .toString()),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => support_table()));
                        },
                        child: CardRow(
                            title: 'عدد الزيارات الملغية',
                            value: datesInstallation
                                .where((element) => element.isDone == "2")
                                .length
                                .toString()),
                      ),

                      _invoice!.clientusername == null
                          ? Container()
                          : CardRow(
                              title: 'يوزر العميل ',
                              value: getnameshort(
                                  _invoice!.clientusername.toString())),
                      CardRow(
                          title: 'حالة الفاتورة',
                          value: _invoice!.stateclient.toString()),
                      CardRow(
                          title: 'عنوان الفاتورة ',
                          value: getnameshort(
                              _invoice!.address_invoice.toString())),
//////////////////////////////////////////////////////////////////////////////////////////
                      _invoice!.daterepaly != null
                          ? CardRow(
                              title: ' تاريخ إعادة الجدولة',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.daterepaly.toString())))
                          : Container(),
                      _invoice!.daterepaly != null
                          ? CardRow(
                              title: ' قام بإعادة الجدولة',
                              value: _invoice!.nameuserreplay.toString())
                          : Container(),
                      _invoice!.daterepaly != null
                          ? CardRow(
                              title: ' سبب إعادة الجدولة',
                              value: _invoice!.reason_date.toString(),
                              isExpanded: true,
                            )
                          : Container(),
                      ///////////////////////////////////////////////
                      _invoice!.dateinstall_task != null
                          ? CardRow(
                              title: ' تاريخ جدولة التركيب ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.dateinstall_task.toString()))
                              // DateFormat.yMMMd().
                              // format(DateTime.parse(_invoice!.dateinstall_task.toString()))
                              )
                          : Container(),
                      _invoice!.dateinstall_task != null
                          ? CardRow(
                              title: ' قام بجدولة التركيب ',
                              value: _invoice!.nameusertask.toString())
                          : Container(),

                      CardRow(
                          title: 'طريقة التركيب ',
                          value: _invoice!.typeInstallation.toString() == '0'
                              ? 'ميداني'
                              : (_invoice!.typeInstallation.toString() == '2'
                                  ? 'عميل موصى به'
                                  : 'اونلاين')),

                      _invoice!.ready_install == '0' &&
                              _invoice!.TypeReadyClient == 'suspend'
                          ? CardRow(
                              title: 'هل تم التركيب للعميل ', value: 'معلق')
                          : _invoice!.ready_install == '0' &&
                                  _invoice!.TypeReadyClient == 'notReady'
                              ? CardRow(
                                  title: 'هل تم التركيب للعميل ',
                                  value: 'غير جاهز')
                              : CardRow(
                                  title: 'هل تم التركيب للعميل ',
                                  value: _invoice!.dateinstall_done == null
                                      ? 'بالانتظار'
                                      : 'تم التركيب'),

                      _invoice!.ready_install == '0' &&
                              _invoice!.dateinstall_done == null
                          ? CardRow(
                              title: 'ملاحظة التعليق',
                              value: _invoice!.notes_ready.toString())
                          : Container(),

                      _invoice!.ready_install == '0' &&
                              _invoice!.TypeReadyClient == 'notReady'
                          ? CardRow(
                              title: 'سبب تعليق العميل',
                              value: _invoice!.reason_notReady.toString())
                          : Container(),
                      _invoice!.ready_install == '0' &&
                              _invoice!.TypeReadyClient == 'suspend'
                          ? CardRow(
                              title: 'سبب تعليق العميل',
                              value: _invoice!.reason_suspend.toString())
                          : Container(),

                      _invoice!.date_readyinstall != null
                          ? CardRow(
                              title: ' تاريخ الغاء تعليق العميل ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.date_readyinstall.toString())))
                          : Container(),
                      _invoice!.date_readyinstall != null
                          ? CardRow(
                              title: ' قام بالغاء تعليق العميل ',
                              value:
                                  _invoice!.nameuser_ready_install.toString())
                          : Container(),
                      _invoice!.date_not_readyinstall != null
                          ? CardRow(
                              title: ' تاريخ تعليق العميل ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(_invoice!.date_not_readyinstall
                                      .toString())))
                          : Container(),
                      _invoice!.date_not_readyinstall != null
                          ? CardRow(
                              title: ' قام بتعليق العميل ',
                              value: _invoice!.nameuser_notready_install
                                  .toString())
                          : Container(),

                      // ///////
                      CustomDoneInstallButton(
                        nameUserClient: _textnameuserclient,
                        invoiceModel: _invoice,
                      ),

                      //////////
                      if (_privilegeCubit.checkPrivilege('43') &&
                          _invoice!.dateinstall_done == null) ...[
                        CustomDoneInstallButton(
                          nameUserClient: _textnameuserclient,
                          invoiceModel: _invoice,
                        )
                      ],

                      //suspend (support)
                      // _invoice!.dateinstall_done != null
                      //     ? Container()
                      //     : Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //
                      //         ],
                      //       ),

                      //not ready (sales)
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
                                              onPressed: _invoice!
                                                          .ready_install ==
                                                      '0'
                                                  ? null
                                                  : () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            DialogReady(
                                                          type_ready: 'suspend',
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
                                              onPressed: _invoice!
                                                          .ready_install ==
                                                      '0'
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
                                            inAsyncCall:
                                                Provider.of<invoice_vm>(context,
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
                                                            child:
                                                                ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              kMainColor)),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true)
                                                                    .pop(
                                                                        false); // dismisses only the dialog and returns false
                                                              },
                                                              child: Text('لا'),
                                                            ),
                                                          ),
                                                          20.horizontalSpace,
                                                          Expanded(
                                                            child:
                                                                ElevatedButton(
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
                                                                      'date_temp': _invoice!
                                                                          .date_not_readyinstall
                                                                          .toString(),
                                                                      'date_ready_prev': _invoice!
                                                                          .date_readyinstall
                                                                          .toString(),
                                                                      'date_readyinstall':
                                                                          DateTime.now()
                                                                              .toString(),
                                                                      'user_ready_install': Provider.of<UserProvider>(
                                                                              context,
                                                                              listen: false)
                                                                          .currentUser
                                                                          .idUser
                                                                          .toString(),
                                                                      'ready_install':
                                                                          '1',
                                                                    },
                                                                        _invoice!
                                                                            .idInvoice).then(
                                                                        (value) =>
                                                                            clear());
                                                                Navigator.of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true)
                                                                    .pop(true);
                                                              },
                                                              child:
                                                                  Text('نعم'),
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
                                      //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
                                    },
                              child: Text('الغاء تعليق العميل')),
                        )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);
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
