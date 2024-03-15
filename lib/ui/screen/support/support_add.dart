import 'dart:io';
import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/page_state/bloc_status.dart';
import '../../../core/di/di_container.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/app/presentation/widgets/app_elvated_button.dart';
import '../../../features/clients_list/data/models/client_support_file_model.dart';
import '../../../features/clients_list/domain/use_cases/crud_client_support_files_usecase.dart';
import '../../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../../features/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/reason_suspend.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import '../../widgets/support_attachments_row.dart';

class SupportAdd extends StatefulWidget {
  const SupportAdd({
    Key? key,
    required this.idInvoice,
    required this.idClient,
  }) : super(key: key);

  final String? idInvoice;
  final String? idClient;

  @override
  _SupportAddState createState() => _SupportAddState();
}

class _SupportAddState extends State<SupportAdd> {
  TextEditingController _textsupport = TextEditingController();
  TextEditingController _textnameuserclient = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _endtimeController = TextEditingController();
  late PrivilegeCubit _privilegeCubit;

  late InvoiceModel? _invoice = null;
  String? fk_client;
  bool valueresoan = false;

  late EventProvider _eventProvider;

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
    _eventProvider = context.read<EventProvider>();
    _privilegeCubit = getIt<PrivilegeCubit>();
    clientsListBloc = context.read<ClientsListBloc>();
    invoiceVm = context.read<invoice_vm>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      clientsListBloc
          .add(GetClientSupportFilesEvent(GetClientSupportFilesParams(
        invoiceId: widget.idInvoice!,
      )));
    });
    selectInstallationType = null;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool isInit = true;
  List<DateInstallationClient> datesInstallation = [];

  File? selectedFile;
  InvoiceModel? _invoiceAttachFile;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _invoice = Provider.of<invoice_vm>(context, listen: true)
        .listinvoiceClientSupport
        .firstWhere((element) => element.idInvoice == widget.idInvoice);

    if (isInit) {
      _invoiceAttachFile = _invoice;
      datesInstallation = List<DateInstallationClient>.of(
          _invoice?.datesInstallationClient ?? []);
      isInit = false;
    }

    final _globalKey = GlobalKey<FormState>();

    final listDates = List<DateInstallationClient>.of(datesInstallation);
    listDates.sort((a, b) => a.dateClientVisit!.compareTo(b.dateClientVisit!));
    final nextInstallation =
        listDates.firstWhereOrNull((element) => element.isDone == "0");

    Widget dialog = SimpleDialog(
        titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
        insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        title: Center(
            child: Text('إضافة موعد جديد',
                style: TextStyle(fontFamily: kfontfamily2))),
        children: [
          StatefulBuilder(
            builder:
                (BuildContext context, void Function(void Function()) refresh) {
              selectedTime == TimeOfDay(hour: -1, minute: 00);
              endTime == TimeOfDay(hour: -1, minute: 00);
              return Directionality(
                textDirection: myui.TextDirection.rtl,
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          hintText:
                              // _invoice!.daterepaly == null
                              //     &&
                              Provider.of<datetime_vm>(context, listen: true)
                                          .valuedateTime ==
                                      DateTime(1, 1, 1)
                                  ? 'تعيين التاريخ' //_currentDate.toString()
                                  :
                                  //_currentDate.toString(),
                                  DateFormat('yyyy-MM-dd').format(
                                      Provider.of<datetime_vm>(context,
                                              listen: true)
                                          .valuedateTime),

                          //_invoice!.daterepaly.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          refresh(() {
                            _selectDate(context);
                          });
                        },
                        validator: (value) {
                          if (_currentDate == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (selectedTime ==
                                    TimeOfDay(hour: -1, minute: 00)) {
                                  return 'يرجى تعيين الوقت ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                hintText: _invoice!.daterepaly == null &&
                                        Provider.of<datetime_vm>(context,
                                                    listen: true)
                                                .selectedStartTime ==
                                            null
                                    ? 'بداية الزيارة'
                                    : Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedStartTime!
                                            .minute
                                            .toString() +
                                        ' : ' +
                                        Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedStartTime!
                                            .hour
                                            .toInt()
                                            .toString(),
                                //_invoice!.dateinstall_task.toString(),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              // / controller: _timeController,
                              readOnly: true,
                              onTap: () {
                                refresh(() {
                                  _selectStartTime(context);
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (endTime ==
                                    TimeOfDay(hour: -1, minute: 00)) {
                                  return 'يرجى تعيين الوقت ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                hintText: _invoice!.daterepaly == null &&
                                        Provider.of<datetime_vm>(context,
                                                    listen: true)
                                                .selectedEndTime ==
                                            null
                                    ? 'نهاية الزيارة ' //_currentDate.toString()
                                    : Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedEndTime!
                                            .minute
                                            .toString() +
                                        ' : ' +
                                        Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedEndTime!
                                            .hour
                                            .toInt()
                                            .toString(),
                                //_invoice!.dateinstall_task.toString(),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              // / controller: _timeController,
                              readOnly: true,
                              onTap: () {
                                refresh(() {
                                  _selectEndTime(context);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RowEdit(name: "نوع التركيب", des: '*'),
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('نوع التركيب'),
                        items: list_installation_type.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one),
                            value: level_one,
                          );
                        }).toList(),
                        value: selectInstallationType,
                        onChanged: (value) {
                          setState(() {
                            selectInstallationType = value.toString();
                            Value_installation_type = value.toString();
                          });
                          Provider.of<datetime_vm>(context, listen: false)
                              .notifyListeners();
                        },
                      ),
                      SizedBox(height: 10),
                      // Assign to
                      RowEdit(name: "اسناد الي", des: '*'),
                      TechSupportUsersDropDown(),
                      SizedBox(height: 15),
                      // save button
                      AppElevatedButton(
                        isLoading:
                            Provider.of<invoice_vm>(context, listen: true)
                                .isloadingdone,
                        text: "حفظ",
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                        ),
                        onPressed: () async {
                          if (Value_installation_type == null ||
                              Value_installation_type!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('من فضلك اختر نوع التركيب ')));
                            return;
                          }
                          if (_globalKey.currentState!.validate()) {
                            Navigator.of(context, rootNavigator: true)
                                .pop(false);
                            _globalKey.currentState!.save();

                            Provider.of<invoice_vm>(context, listen: false)
                                .setisload();
                            final startDate = _currentDate ?? DateTime.now();
                            DateTime datetask = DateTime(
                                startDate.year,
                                startDate.month,
                                startDate.day,
                                selectedTime.hour,
                                selectedTime.minute);
                            DateTime date_end = DateTime(
                                startDate.year,
                                startDate.month,
                                startDate.day,
                                endTime.hour,
                                endTime.minute);

                            Provider.of<invoice_vm>(context, listen: false)
                                .setdate_vm(
                              id_invoice: _invoice!.idInvoice!,
                              fk_client: widget.idClient!,
                              fk_user: iduser,
                              date_client_visit: datetask.toString(),
                              date_end: date_end.toString(),
                              type_date: Value_installation_type!,
                              onSuccess: (value) {
                                DateTime temp = datetask.hour >= 21
                                    ? datetask.subtract(Duration(hours: 3))
                                    : datetask;

                                final event = EventModel(
                                  fkIdClient: widget.idClient!,
                                  idinvoice: _invoice!.idInvoice!,
                                  title: _invoice!.name_enterprise!,
                                  description: "description",
                                  from: temp,
                                  to: temp.add(Duration(hours: 2)),
                                  typedate: '',
                                );

                                _eventProvider.addEvent(event);
                              },
                            )
                                .then((value) {
                              clear();

                              datesInstallation.add(DateInstallationClient(
                                dateClientVisit: datetask,
                                fkUser: iduser,
                                fkClient: widget.idClient,
                                isDone: '0',
                                fkInvoice: _invoice!.idInvoice,
                              ));

                              setState(() {});
                            });
                            _currentDate = DateTime(1, 1, 1);
                            selectedTime = TimeOfDay(hour: -1, minute: 00);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]);

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
                      //                 fileUrl: urlfile + file.fileUrl,
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
                                    builder: (context) => dialog);
                              },
                              child: Text('إضافة موعد التركيب والتدريب'),
                            )
                          // : Container()
                          : Container(),

                      SizedBox(height: 20),
                      _invoice!.dateinstall_done == null
                          ? Container()
                          : cardRow(
                              title: ' تاريخ التركيب ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.dateinstall_done.toString()))),

                      _invoice!.dateinstall_done == null
                          ? Container()
                          : cardRow(
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
                          child: cardRow(
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
                        child: cardRow(
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
                        child: cardRow(
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
                        child: cardRow(
                            title: 'عدد الزيارات الملغية',
                            value: datesInstallation
                                .where((element) => element.isDone == "2")
                                .length
                                .toString()),
                      ),

                      _invoice!.clientusername == null
                          ? Container()
                          : cardRow(
                              title: 'يوزر العميل ',
                              value: getnameshort(
                                  _invoice!.clientusername.toString())),
                      cardRow(
                          title: 'حالة الفاتورة',
                          value: _invoice!.stateclient.toString()),
                      cardRow(
                          title: 'عنوان الفاتورة ',
                          value: getnameshort(
                              _invoice!.address_invoice.toString())),
//////////////////////////////////////////////////////////////////////////////////////////
                      _invoice!.daterepaly != null
                          ? cardRow(
                              title: ' تاريخ إعادة الجدولة',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.daterepaly.toString())))
                          : Container(),
                      _invoice!.daterepaly != null
                          ? cardRow(
                              title: ' قام بإعادة الجدولة',
                              value: _invoice!.nameuserreplay.toString())
                          : Container(),
                      _invoice!.daterepaly != null
                          ? cardRow(
                              title: ' سبب إعادة الجدولة',
                              value: _invoice!.reason_date.toString(),
                              isExpanded: true,
                            )
                          : Container(),
                      ///////////////////////////////////////////////
                      _invoice!.dateinstall_task != null
                          ? cardRow(
                              title: ' تاريخ جدولة التركيب ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.dateinstall_task.toString()))
                              // DateFormat.yMMMd().
                              // format(DateTime.parse(_invoice!.dateinstall_task.toString()))
                              )
                          : Container(),
                      _invoice!.dateinstall_task != null
                          ? cardRow(
                              title: ' قام بجدولة التركيب ',
                              value: _invoice!.nameusertask.toString())
                          : Container(),

                      cardRow(
                          title: 'طريقة التركيب ',
                          value: _invoice!.typeInstallation.toString() == '0'
                              ? 'ميداني'
                              : (_invoice!.typeInstallation.toString() == '2'
                                  ? 'عميل موصى به'
                                  : 'اونلاين')),

                      _invoice!.ready_install == '0' &&
                              _invoice!.TypeReadyClient == 'suspend'
                          ? cardRow(
                              title: 'هل تم التركيب للعميل ', value: 'معلق')
                          : _invoice!.ready_install == '0' &&
                                  _invoice!.TypeReadyClient == 'notReady'
                              ? cardRow(
                                  title: 'هل تم التركيب للعميل ',
                                  value: 'غير جاهز')
                              : cardRow(
                                  title: 'هل تم التركيب للعميل ',
                                  value: _invoice!.dateinstall_done == null
                                      ? 'بالانتظار'
                                      : 'تم التركيب'),

                      _invoice!.ready_install == '0' &&
                              _invoice!.dateinstall_done == null
                          ? cardRow(
                              title: 'ملاحظة التعليق',
                              value: _invoice!.notes_ready.toString())
                          : Container(),

                      _invoice!.ready_install == '0' &&
                              _invoice!.TypeReadyClient == 'notReady'
                          ? cardRow(
                              title: 'سبب تعليق العميل',
                              value: _invoice!.reason_notReady.toString())
                          : Container(),
                      _invoice!.ready_install == '0' &&
                              _invoice!.TypeReadyClient == 'suspend'
                          ? cardRow(
                              title: 'سبب تعليق العميل',
                              value: _invoice!.reason_suspend.toString())
                          : Container(),

                      _invoice!.date_readyinstall != null
                          ? cardRow(
                              title: ' تاريخ الغاء تعليق العميل ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      _invoice!.date_readyinstall.toString())))
                          : Container(),
                      _invoice!.date_readyinstall != null
                          ? cardRow(
                              title: ' قام بالغاء تعليق العميل ',
                              value:
                                  _invoice!.nameuser_ready_install.toString())
                          : Container(),
                      _invoice!.date_not_readyinstall != null
                          ? cardRow(
                              title: ' تاريخ تعليق العميل ',
                              value: DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(_invoice!.date_not_readyinstall
                                      .toString())))
                          : Container(),
                      _invoice!.date_not_readyinstall != null
                          ? cardRow(
                              title: ' قام بتعليق العميل ',
                              value: _invoice!.nameuser_notready_install
                                  .toString())
                          : Container(),

                      _privilegeCubit.checkPrivilege('43')
                          ? _invoice!.dateinstall_done == null
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kMainColor)),
                                  onPressed: () async {
                                    if (_invoice!.ready_install == '0')
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'العميل غير جاهز للتركيب ')));
                                    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('العميل غير جاهز للتركيب ')));
                                    else {
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Directionality(
                                              textDirection:
                                                  myui.TextDirection.rtl,
                                              child: AlertDialog(
                                                title: Text('التأكيد'),
                                                content: Text(
                                                    'هل تريد تأكيد عملية التركيب'),
                                                actions: <Widget>[
                                                  Column(
                                                    children: [
                                                      EditTextFormField(
                                                        maxline: 4,
                                                        paddcustom:
                                                            EdgeInsets.all(10),
                                                        hintText:
                                                            ' يوزر العميل',
                                                        obscureText: false,
                                                        controller:
                                                            _textnameuserclient,
                                                        vaildator: (value) {
                                                          if (value
                                                              .toString()
                                                              .trim()
                                                              .isEmpty) {
                                                            return 'الحقل فارغ';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      SizedBox(height: 10),
                                                      Consumer<invoice_vm>(
                                                          builder: (context,
                                                              invoice, _) {
                                                        if (invoice
                                                            .isloadingdone) {
                                                          return Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        }

                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(
                                                                            kMainColor)),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context,
                                                                          rootNavigator:
                                                                              true)
                                                                      .pop(
                                                                          false); // dismisses only the dialog and returns false
                                                                },
                                                                child:
                                                                    Text('لا'),
                                                              ),
                                                            ),
                                                            10.horizontalSpace,
                                                            Expanded(
                                                              child:
                                                                  ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(
                                                                            kMainColor)),
                                                                onPressed:
                                                                    () async {
                                                                  try {
                                                                    Provider.of<invoice_vm>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .setisload();
                                                                    await Provider.of<config_vm>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .getAllConfig();
                                                                    List<ConfigModel>
                                                                        _listconfg =
                                                                        Provider.of<config_vm>(context,
                                                                                listen: false)
                                                                            .listofconfig;
                                                                    ConfigModel
                                                                        peroid =
                                                                        _listconfg.firstWhere((element) =>
                                                                            element.name_config ==
                                                                            'period_commincation3'); //تواصل دوري
                                                                    DateTime
                                                                        datanext =
                                                                        DateTime
                                                                            .now();
                                                                    int peroidtime =
                                                                        int.parse(
                                                                            peroid.value_config);
                                                                    datanext = Jiffy()
                                                                        .add(
                                                                            days:
                                                                                peroidtime)
                                                                        .dateTime;

                                                                    peroid = _listconfg.firstWhere((element) =>
                                                                        element
                                                                            .name_config ==
                                                                        'period_commincation2'); //تواصل دوري
                                                                    DateTime
                                                                        datanext_install =
                                                                        DateTime
                                                                            .now();
                                                                    peroidtime =
                                                                        int.parse(
                                                                            peroid.value_config);
                                                                    datanext_install = Jiffy()
                                                                        .add(
                                                                            days:
                                                                                peroidtime)
                                                                        .dateTime;

                                                                    await Provider.of<invoice_vm>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .setdatedone_vm(
                                                                            {
                                                                          'clientusername':
                                                                              _textnameuserclient.text,
                                                                          'datanext':
                                                                              datanext.toString(),
                                                                          'datanext_install':
                                                                              datanext_install.toString(),
                                                                          'dateinstall_done':
                                                                              DateTime.now().toString(),
                                                                          'userinstall': Provider.of<UserProvider>(context, listen: false)
                                                                              .currentUser
                                                                              .idUser
                                                                              .toString(),
                                                                          'isdoneinstall':
                                                                              '1',
                                                                          'fkIdClient':
                                                                              _invoice!.fkIdClient,
                                                                          'nameuserinstall': Provider.of<UserProvider>(context, listen: false)
                                                                              .currentUser
                                                                              .nameUser
                                                                              .toString(),
                                                                          'name_enterprise':
                                                                              _invoice!.name_enterprise,
                                                                          'fkcountry':
                                                                              _invoice!.fk_country,
                                                                          'fk_regoin':
                                                                              _invoice!.fk_regoin
                                                                        },
                                                                            _invoice!
                                                                                .idInvoice).then(
                                                                            (value) {
                                                                      if (value) {
                                                                        clear();
                                                                        Navigator.of(context,
                                                                                rootNavigator: true)
                                                                            .pop(true);
                                                                      } else {
                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                            content:
                                                                                Text('حدث خطأ ما.')));
                                                                      }
                                                                    });
                                                                  } catch (e) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(SnackBar(
                                                                            content:
                                                                                Text('حدث خطأ ما.')));
                                                                    Provider.of<invoice_vm>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .setisload(
                                                                            isLoading:
                                                                                false);
                                                                  }
                                                                },
                                                                child:
                                                                    Text('نعم'),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      })
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    }
                                    //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
                                  },
                                  child: Text('تم التركيب للعميل'))
                              : Container()
                          : Container(),

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
                                // Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('152') == true ?
                                // ElevatedButton(
                                //     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                //     onPressed: _invoice!.ready_install == '1'
                                //         ? null
                                //         : () async {
                                //       await showDialog(
                                //         context: context,
                                //         builder: (context) {
                                //           return ModalProgressHUD(
                                //             inAsyncCall:
                                //             Provider.of<invoice_vm>(context, listen: true).isloadingdone,
                                //             child: Directionality(
                                //               textDirection: myui.TextDirection.rtl,
                                //               child: AlertDialog(
                                //                 title:   Text('التأكيد'),
                                //                 content: Text('هل تريد تحويل العميل إلى جاهز للتركيب '),
                                //                 actions: <Widget>[
                                //                   Column(
                                //                     children: [
                                //                       SizedBox(height: 10),
                                //                       Row(
                                //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //                         children: [
                                //                           ElevatedButton(
                                //                             style: ButtonStyle(
                                //                                 backgroundColor:
                                //                                 MaterialStateProperty.all(kMainColor)),
                                //                             onPressed: () {
                                //                               Navigator.of(context, rootNavigator: true).pop(
                                //                                   false); // dismisses only the dialog and returns false
                                //                             },
                                //                             child: Text('لا'),
                                //                           ),
                                //                           ElevatedButton(
                                //                             style: ButtonStyle(
                                //                                 backgroundColor:
                                //                                 MaterialStateProperty.all(kMainColor)),
                                //                             onPressed: () async {
                                //                               Provider.of<invoice_vm>(context, listen: false)
                                //                                   .setisload();
                                //
                                //                               await Provider.of<invoice_vm>(context,
                                //                                   listen: false)
                                //                                   .set_ready_install({
                                //                                 'date_temp': _invoice!.date_not_readyinstall
                                //                                     .toString(),
                                //                                 'date_ready_prev':
                                //                                 _invoice!.date_readyinstall.toString(),
                                //                                 'date_readyinstall':
                                //                                 DateTime.now().toString(),
                                //                                 'user_ready_install':
                                //                                 Provider.of<UserProvider>(context,
                                //                                     listen: false)
                                //                                     .currentUser
                                //                                     .idUser
                                //                                     .toString(),
                                //                                 'ready_install': '1',
                                //                               }, _invoice!.idInvoice).then(
                                //                                       (value) => clear());
                                //                               Navigator.of(context, rootNavigator: true)
                                //                                   .pop(true);
                                //                             },
                                //                             child: Text('نعم'),
                                //                           ),
                                //                         ],
                                //                       )
                                //                     ],
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           );
                                //         },
                                //       );
                                //     },
                                //     child: Text('جاهز للتركيب'))
                                //     : Container(),
                                //

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
                                                            dialog_ready(
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
                                              onPressed:
                                                  _invoice!.ready_install == '0'
                                                      ? null
                                                      : () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                dialog_ready(
                                                              type_ready:
                                                                  'notReady',
                                                              invoice:
                                                                  _invoice!,
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

  Widget _attachmentWidget({required BlocStatus crudClientSupportFilesStatus}) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: selectedFile != null
          ? Stack(
              children: [
                // selected file
                Positioned.fill(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(selectedFile!, fit: BoxFit.cover),
                )),
                // icon buttons
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // upload icon
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Builder(
                          builder: (context) {
                            if (crudClientSupportFilesStatus.isLoading()) {
                              return CustomLoadingIndicator();
                            } else if (crudClientSupportFilesStatus.isFail()) {
                              return CustomErrorWidget(
                                color: Colors.red,
                                onPressed: () {
                                  _uploadFile();
                                },
                              );
                            }
                            return InkWell(
                              onTap: () {
                                _uploadFile();
                              },
                              child: Icon(
                                Icons.done,
                                color: kMainColor,
                                size: 20,
                              ),
                            );
                          },
                        ),
                      ),
                      // delete icon
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedFile = null;
                          });
                        },
                        borderRadius: BorderRadius.circular(90),
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(top: 10, left: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            )
          : InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => pickImage(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attachment_rounded,
                      color: Colors.grey.shade700, size: 35),
                  SizedBox(height: 0),
                  Text(
                    'Attach file',
                    style: context.textTheme.titleMedium?.copyWith(
                        fontFamily: kfontfamily2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600),
                  )
                ],
              ),
            ),
    );
  }

  void _uploadFile() {
    clientsListBloc.add(CrudClientSupportFilesEvent(
      CrudClientSupportFilesParams(
        invoiceId: widget.idInvoice!,
        deletedFiles: [],
        addedFiles: [selectedFile!],
      ),
      onSuccess: (value) {
        setState(() {
          selectedFile = null;
        });
      },
    ));
  }

  Widget fileImage(ClientSupportFileModel file, VoidCallback onDelete) {
    return SizedBox(
      height: 125,
      width: 110,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        width: 110,
                        decoration:
                            BoxDecoration(color: kMainColor.withOpacity(0.1)),
                        child: Icon(
                          Icons.picture_as_pdf_rounded,
                          color: Colors.grey,
                        )),
                  ),
                ),
                5.verticalSpacingRadius,
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(90),
                child: Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.only(top: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child:
                      Icon(Icons.delete_rounded, color: Colors.red, size: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget networkImage(FileAttach fileAttach, VoidCallback onDelete) {
    return InkWell(
      onTap: () {
        invoiceVm.openFile(attachFile: fileAttach);
      },
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FancyImageShimmerViewer(
                  imageUrl:
                      "${EndPoints.laravelUrl_Image}${fileAttach.fileAttach}",
                  fit: BoxFit.cover,
                ),
                // Image.network(
                //   "${EndPoints.laravelUrl}${fileAttach.fileAttach}",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            if (context.read<PrivilegeCubit>().checkPrivilege('146') == true)
              StatefulBuilder(
                builder: (context, setState) {
                  return Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: onDelete,
                        borderRadius: BorderRadius.circular(90),
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(top: 5, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.delete_rounded,
                              color: Colors.red, size: 17),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  DateTime _currentDate = DateTime.now();
  DateTime? _EndDate;

  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);
  TimeOfDay endTime = TimeOfDay(hour: -1, minute: 00);
  late double _height;
  late double _width;

  late String _hour, _minute, _time;

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked == null) return;

    if (context.read<datetime_vm>().selectedEndTime != null) {
      final startTime = DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day,
        picked.hour,
        picked.minute,
      );

      // _date
      final endTime = DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day,
        context.read<datetime_vm>().selectedEndTime!.hour,
        context.read<datetime_vm>().selectedEndTime!.minute,
      );

      if (startTime.isAfter(endTime)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('يجب أن يكون وقت البداية قبل وقت النهاية'),
        ));
        return;
      }
    }

    setState(() {
      selectedTime = picked;
      _hour = selectedTime.hour.toString();
      _minute = selectedTime.minute.toString();
      _time = _hour + ' : ' + _minute;
      _timeController.text = _time;
      _timeController.text = selectedTime.toString();
    });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(_currentDate, selectedTime);
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked == null) return;

    if (context.read<datetime_vm>().selectedStartTime != null) {
      final endDate = DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day,
        picked.hour,
        picked.minute,
      );

      final startTime = DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day,
        context.read<datetime_vm>().selectedStartTime!.hour,
        context.read<datetime_vm>().selectedStartTime!.minute,
      );

      if (startTime.isAfter(endDate)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('يجب أن يكون وقت البداية قبل وقت النهاية'),
        ));
        return;
      }
    }

    setState(() {
      endTime = picked;
      _hour = endTime.hour.toString();
      _minute = endTime.minute.toString();
      _time = _hour + ' : ' + _minute;
      _endtimeController.text = _time;
      _endtimeController.text = endTime.toString();
    });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalueEnd(_currentDate, endTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: DateTime.now(),
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(3010));
    if (pickedDate == null) return;

    setState(() {
      _currentDate = pickedDate;

      _currentDate.add(Duration(hours: DateTime.now().hour));
    });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(_currentDate, null);
  }

  clear() {
    _currentDate = DateTime.now();
    _EndDate = null;

    endTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    selectInstallationType = null;
    Value_installation_type = null;
    // setState(() {
    //  });
  }

  clear2() {
    Navigator.of(context, rootNavigator: true).pop(false);
    _currentDate = DateTime(1, 1, 1);
    _EndDate = null;
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    endTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('تم التثبيت بنجاح')));
  }

  pickImage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(
        onPickFile: (context, file) {
          selectedFile = file;
          _invoiceAttachFile = _invoiceAttachFile?.copyWith(
              attachFileStatus: AttachFileStatus.init);
          setState(() {});
        },
      ),
    );
  }

  uploadAttachedFile() {
    context.read<invoice_vm>().uploadAttachedFile(
          idInvoice: _invoiceAttachFile!.idInvoice!,
          file: selectedFile!,
          onLoading: () {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(
                attachFileStatus: AttachFileStatus.loading);
            setState(() {});
          },
          onSuccess: (imageUrl) {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(
              attachFileStatus: AttachFileStatus.success,
              fileAttach: imageUrl,
            );
            selectedFile = null;
            setState(() {});
          },
          onFailure: () {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(
                attachFileStatus: AttachFileStatus.failed);
            setState(() {});
          },
        );
  }

  deleteFile() {
    context.read<invoice_vm>().deleteFile(
          idInvoice: _invoiceAttachFile!.idInvoice!,
          onLoading: () {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(
                deleteAttachFileStatus: AttachFileStatus.loading);
            setState(() {});
          },
          onSuccess: () {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(
              deleteAttachFileStatus: AttachFileStatus.success,
              deleteImage: true,
            );
            selectedFile = null;
            setState(() {});
          },
          onFailure: () {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(
                deleteAttachFileStatus: AttachFileStatus.failed);
            setState(() {});
          },
        );
  }
}

class dialog_ready extends StatefulWidget {
  dialog_ready({required this.invoice, required this.type_ready, Key? key})
      : super(key: key);
  String type_ready;
  InvoiceModel invoice;

  @override
  State<dialog_ready> createState() => _dialog_readyState();
}

class _dialog_readyState extends State<dialog_ready> {
  String title = '';
  String Value_sales = '';

  // late InvoiceModel _invoice;

  @override
  void initState() {
    // TODO: implement initState

    widget.type_ready == 'suspend' ? 'تعليق العميل' : 'تحويل العميل لغير جاهز';
    super.initState();
  }

  final _globalKey = GlobalKey<FormState>();
  final TextEditingController descresaonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      title: Center(
          child: Text(title, style: TextStyle(fontFamily: kfontfamily2))),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Form(
                key: _globalKey,
                child: Column(
                  children: [
                    RowEdit(name: "تحديد الأسباب", des: '*'),
                    widget.type_ready == 'suspend'
                        ? Consumer<reason_suspend>(
                            builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text(''),
                                items:
                                    cart.list_reason_suspend.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one),
                                    value: level_one,
                                  );
                                }).toList(),
                                value: cart.selectedValuemanag,
                                onChanged: (value) {
                                  cart.changevalue(value.toString());
                                  Value_sales = value.toString();
                                  //typeclientvalue = value.toString();
                                  // filtershow();
                                },
                              );
                            },
                          )
                        : Consumer<reason_suspend>(
                            builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text(''),
                                items: cart.list_reason_sales.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one),
                                    value: level_one,
                                  );
                                }).toList(),
                                value: cart.selectedValue_sales,
                                onChanged: (value) {
                                  cart.changevalue_sales(value.toString());
                                  Value_sales = value.toString();
                                  // filtershow();
                                },
                              );
                            },
                          ),
                    SizedBox(height: 3),
                    EditTextFormField(
                      controller: descresaonController,
                      vaildator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                        return null;
                      },
                      hintText: "الملاحظات*",
                      paddcustom: EdgeInsets.all(8),
                      maxline: 5,
                    ),
                    Consumer<invoice_vm>(
                      builder: (context, value, child) {
                        if (value.isloading) return CustomLoadingIndicator();
                        return widget.type_ready == 'suspend'
                            ? _buildSuspendAlertDialog(context)
                            : Directionality(
                                textDirection: myui.TextDirection.rtl,
                                child: _buildNotReadyAlertDialog(context),
                              );
                        // ModalProgressHUD(
                        //         inAsyncCall: Provider.of<invoice_vm>(context,
                        //                 listen: true)
                        //             .isloadingdone,
                        //         child: Directionality(
                        //           textDirection: myui.TextDirection.rtl,
                        //           child: _buildNotReadyAlertDialog(context),
                        //         ),
                        //       );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildSuspendAlertDialog(BuildContext context) {
    return Directionality(
      textDirection: myui.TextDirection.rtl,
      child: AlertDialog(
        title: Text('التأكيد'),
        content: Text('هل تريد تحويل العميل لمعلق'),
        actions: <Widget>[
          Consumer<invoice_vm>(
            builder: (context, val, _) {
              return Column(
                children: [
                  SizedBox(height: 10),
                  if (val.isloadingdone)
                    Center(child: CircularProgressIndicator())
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(false);
                            },
                            child: Text('لا'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
                            onPressed: () async {
                              if (Value_sales == '')
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'من فضلك اختر سبب من القائمة ')));
                              else {
                                Provider.of<invoice_vm>(context, listen: false)
                                    .setisload();
                                final currentUser =
                                    context.read<UserProvider>().currentUser;
                                var body = {
                                  'TypeReadyClient': 'suspend',
                                  'notes_ready': descresaonController.text,
                                  'reason_suspend': Value_sales,
                                  'nameUser': currentUser.nameUser.toString(),
                                  'date_temp': widget
                                      .invoice.date_not_readyinstall
                                      .toString(),
                                  'date_ready_prev': widget
                                      .invoice.date_readyinstall
                                      .toString(),
                                  'date_not_readyinstall':
                                      DateTime.now().toString(),
                                  'user_not_ready_install':
                                      currentUser.idUser.toString(),
                                  'ready_install': '0', //suspend client
                                };
                                if (widget.invoice.count_delay_ready != null)
                                  body.addAll({
                                    'count_delay_ready': widget
                                        .invoice.count_delay_ready
                                        .toString()
                                  });

                                await Provider.of<invoice_vm>(context,
                                        listen: false)
                                    .set_ready_install(
                                        body, widget.invoice.idInvoice)
                                    .then((value) => clear());
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true);
                              }
                            },
                            child: Text('نعم'),
                          ),
                        ),
                      ],
                    )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotReadyAlertDialog(BuildContext context) {
    return AlertDialog(
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
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kMainColor)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(false);
                    },
                    child: Text('لا'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AppElevatedButton(
                    isLoading: Provider.of<invoice_vm>(context, listen: true)
                        .isloadingdone,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kMainColor)),
                    onPressed: () async {
                      if (Value_sales == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('من فضلك اختر سبب من القائمة ')));
                        return;
                      }

                      if (!_globalKey.currentState!.validate()) return;

                      Provider.of<invoice_vm>(context, listen: false)
                          .setisload();
                      final currentUser =
                          context.read<UserProvider>().currentUser;

                      var body = {
                        'TypeReadyClient': 'notReady',
                        'notes_ready': descresaonController.text,
                        'reason_notReady': Value_sales,
                        'nameUser': currentUser.nameUser.toString(),
                        'date_temp':
                            widget.invoice.date_not_readyinstall.toString(),
                        'date_ready_prev':
                            widget.invoice.date_readyinstall.toString(),
                        'date_not_readyinstall': DateTime.now().toString(),
                        'user_not_ready_install': currentUser.idUser.toString(),
                        'ready_install': '0', //suspend client
                      };
                      if (widget.invoice.count_delay_ready != null)
                        body.addAll({
                          'count_delay_ready':
                              widget.invoice.count_delay_ready.toString()
                        });

                      await Provider.of<invoice_vm>(context, listen: false)
                          .set_ready_install(body, widget.invoice.idInvoice)
                          .then((value) => clear());
                      Navigator.of(context, rootNavigator: true).pop(true);
                    },
                    child: Text('نعم'),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  clear() {}
}

class TechSupportUsersDropDown extends StatefulWidget {
  const TechSupportUsersDropDown({
    Key? key,
    this.clear = false,
    this.fkUser,
  }) : super(key: key);

  final bool clear;
  final String? fkUser;

  @override
  State<TechSupportUsersDropDown> createState() =>
      _TechSupportUsersDropDownState();
}

class _TechSupportUsersDropDownState extends State<TechSupportUsersDropDown> {
  late final EventProvider eventProvider;

  @override
  void initState() {
    eventProvider = context.read<EventProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.fkUser != null) {
        onSelectUser();
      }
      if (widget.clear) {
        _clearUser(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer2<UserProvider, EventProvider>(
          builder: (context, user, event, child) {
            return DropdownSearch<UserModel>(
              dropdownButtonBuilder: (context) => SizedBox.shrink(),
              mode: Mode.DIALOG,
              filterFn: (user, filter) => user!.getfilteruser(filter!),
              compareFn: (item, selectedItem) =>
                  item?.idUser == selectedItem?.idUser,
              showSelectedItems: true,
              items: user.usersSupportManagement,
              itemAsString: (u) => u!.userAsString(),
              onChanged: (user) {
                onSelectUser(user);
              },
              selectedItem: user.selectedUser,
              showSearchBox: true,
              dropdownSearchDecoration: InputDecoration(
                isCollapsed: true,
                hintText: 'موظف الدعم الفني',
                alignLabelWithHint: true,
                fillColor: Colors.grey.withOpacity(0.2),
                border: UnderlineInputBorder(
                    borderSide: const BorderSide(
                  color: Colors.grey,
                )),
                contentPadding: EdgeInsets.zero,
                suffix: Icon(Icons.arrow_drop_down),
              ),
              validator: (value) {
                if (value == null) {
                  return 'يرجى اختيار موظف الدعم الفني';
                }
                return null;
              },
            );
          },
        );
      },
    );
  }

  void onSelectUser([UserModel? user]) {
    if (widget.fkUser != null) {
      context.read<UserProvider>().changeValUserID(widget.fkUser);
    }
    if (user == null) {
      return;
    }
    context.read<UserProvider>().changevalueuser(user);
    iduser = user.idUser!;
    eventProvider.onChangeFkUser(iduser);
  }

  void _clearUser(BuildContext context) {
    iduser = "";
    eventProvider.onChangeFkUser(iduser, true);
    context.read<UserProvider>().changevalueuser(null, true);
  }
}
