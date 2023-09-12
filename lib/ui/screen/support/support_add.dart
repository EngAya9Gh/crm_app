import 'dart:io';
import 'dart:ui' as myui;

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/calendar/event.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/fancy_image_shimmer_viewer.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_photo_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';

class support_add extends StatefulWidget {
  support_add({required this.idinvoice, required this.idClient, Key? key}) : super(key: key);
  String? idinvoice;
  String? idClient;

  @override
  _support_addState createState() => _support_addState();
}

class _support_addState extends State<support_add> {
  TextEditingController _textsupport = TextEditingController();
  TextEditingController _textnameuserclient = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late InvoiceModel? _invoice = null;
  String? fk_client;
  bool valueresoan = false;

  late EventProvider _eventProvider;

  @override
  void dispose() {
    _textsupport.dispose();
    _textnameuserclient.dispose();
    _timeController.dispose();
    super.dispose();
  }

  late TimeOfDay timinit;

  @override
  void initState() {
    timinit = TimeOfDay.now();
    _eventProvider = context.read<EventProvider>();
    // if (widget.idinvoice != '') {
    //   // _invoice = Provider
    //   //     .of<invoice_vm>(context, listen: false)
    //   //     .listinvoices
    //   //     .firstWhere(
    //   //         (element) =>
    //   //     element.idInvoice == widget.idinvoice);
    //   // _textsupport.text = _invoice!.reason_date.toString();
    // _timeController.text = DateTime.now().hour.toString()+':'
    // + DateTime.now().minute.toString();
    // formatDate(
    // DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
    // [hh, ':', nn, " ", am]).toString();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //_ticketModel=_list.firstWhere((element) => element.fkClient)
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));

      //  Provider.of<typeclient>(context,listen: false).getreasons('ticket');
    });

    print('init support');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //   _invoice = Provider
    //       .of<invoice_vm>(context, listen: false)
    //       .listinvoices
    //       .firstWhere(
    //           (element) =>
    //       element.idInvoice == widget.idinvoice);
    // });

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
        .listinvoiceClientSupport //.listinvoices
        .firstWhere((element) => element.idInvoice == widget.idinvoice);

    if (isInit) {
      _invoiceAttachFile = _invoice;
      datesInstallation = List<DateInstallationClient>.of(_invoice?.datesInstallationClient ?? []);
      isInit = false;
    }

    final _globalKey = GlobalKey<FormState>();

    final listDates = List<DateInstallationClient>.of(datesInstallation ?? []);
    listDates.sort((a, b) => a.date_client_visit!.compareTo(b.date_client_visit!));
    final nextInstallation = listDates.firstWhereOrNull((element) => element.is_done == "0");

    Widget dialog = SimpleDialog(
        titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
        insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        title: Center(child: Text('إضافة موعد جديد', style: TextStyle(fontFamily: kfontfamily2))),
        children: [
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) refresh) {
              selectedTime == TimeOfDay(hour: -1, minute: 00);
              return Directionality(
                textDirection: myui.TextDirection.rtl,
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle:
                                    const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                hintText:
                                    // _invoice!.daterepaly == null
                                    //     &&
                                    Provider.of<datetime_vm>(context, listen: true).valuedateTime == DateTime(1, 1, 1)
                                        ? 'تعيين التاريخ' //_currentDate.toString()
                                        :
                                        //_currentDate.toString(),
                                        DateFormat('yyyy-MM-dd')
                                            .format(Provider.of<datetime_vm>(context, listen: true).valuedateTime),

                                //_invoice!.daterepaly.toString(),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              readOnly: true,
                              onTap: () {
                                refresh(() {
                                  _selectDate(context, DateTime.now());
                                  print('before on tap ' + _currentDate.toString());
                                });
                              },
                              validator: (value) {
                                if (_currentDate == DateTime(1, 1, 1)) {
                                  return 'يرجى تعيين التاريخ ';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (selectedTime == TimeOfDay(hour: -1, minute: 00)) {
                                  return 'يرجى تعيين الوقت ';
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle:
                                    const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                hintText: _invoice!.daterepaly == null &&
                                        Provider.of<datetime_vm>(context, listen: true).selectedTime ==
                                            TimeOfDay(hour: -1, minute: 00)
                                    ? 'الوقت ' //_currentDate.toString()
                                    : Provider.of<datetime_vm>(context, listen: true).selectedTime.minute.toString() +
                                        ' : ' +
                                        Provider.of<datetime_vm>(context, listen: true)
                                            .selectedTime
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
                                  _selectTime(context, timinit);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 5),
                      // EditTextFormField(
                      //   maxline: 4,
                      //   paddcustom: EdgeInsets.all(10),
                      //   hintText: 'أسباب إعادة الجدولة',
                      //   obscureText: false,
                      //   controller: _textsupport,
                      //   vaild: (value) {
                      //     if (value.toString().trim().isEmpty) {
                      //       return 'الحقل فارغ';
                      //     }
                      //   },
                      // ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: "حفظ",
                        onTap: () async {
                          DateTime datetask = DateTime(_currentDate.year, _currentDate.month, _currentDate.day,
                              selectedTime.hour, selectedTime.minute);
                          if (_globalKey.currentState!.validate()) {
                            Navigator.of(context, rootNavigator: true).pop(false);
                            _globalKey.currentState!.save();

                            // Provider.of<invoice_vm>(context, listen: false).setdate_vm({
                            //   // 'fk_invoice':,
                            //   // 'fk_idClient':,
                            //   // 'fk_idUser':,
                            //   // 'type_date':,
                            //   // 'date_install':,
                            //   'fk_client': _invoice!.fkIdClient.toString(),
                            //   'fk_regoin': _invoice!.fk_regoin.toString(),
                            //   'fkcountry': _invoice!.fk_country.toString(),
                            //   "namedatareplay": Provider.of<user_vm_provider>(context, listen: false)
                            //       .currentUser
                            //       .nameUser
                            //       .toString(),
                            //   "name_enterprise": _invoice!.name_enterprise.toString().toString(),
                            //   'daterepaly': datetask.toString(),
                            //   'fkuserdatareplay':
                            //       Provider.of<user_vm_provider>(context, listen: false).currentUser.idUser,
                            //   'reason_date': _textsupport.text.toString()
                            // }, _invoice!.idInvoice).then((value) => clear());

                            // if( selectedTime != TimeOfDay(hour: -10, minute: 00)
                            //     && _currentDate!= DateTime(1, 1, 1)) {

                            Provider.of<invoice_vm>(context, listen: false).setisload();
                            DateTime datetask = DateTime(_currentDate.year, _currentDate.month, _currentDate.day,
                                selectedTime.hour, selectedTime.minute);

                            final idUser = Provider.of<user_vm_provider>(context, listen: false).currentUser.idUser;
                            Provider.of<invoice_vm>(context, listen: false)
                                .setdate_vm(
                              id_invoice: _invoice!.idInvoice!,
                              fk_client: widget.idClient!,
                              fk_user: idUser!,
                              date_client_visit: datetask.toString(),
                              onSuccess: (value) {
                                DateTime temp = datetask.hour >= 21 ? datetask.subtract(Duration(hours: 3)) : datetask;

                                final event = Event(
                                  fkIdClient: widget.idClient!,
                                  idinvoice: _invoice!.idInvoice!,
                                  title: _invoice!.name_enterprise!,
                                  description: "description",
                                  from: temp,
                                  to: temp.add(Duration(hours: 2)),
                                );

                                _eventProvider.addEvent(event);
                              },
                            )
                                .then((value) {
                              clear();

                              datesInstallation.add(DateInstallationClient(
                                date_client_visit: datetask,
                                fk_user: idUser,
                                fk_client: widget.idClient,
                                is_done: '0',
                                fk_invoice: _invoice!.idInvoice,
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
                'فاتورة  ' + _invoice!.date_approve.toString(),
                '#'+ _invoice!.idInvoice.toString(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
                  child: Column(
                    children: [
                      // _invoice!.dateinstall_done == null && _invoice!.dateinstall_task == null
                      //     ? RowEdit(name: 'تحديد موعد التركيب والتدريب ', des: '')
                      //     : Container(),
                      // SizedBox(height: 10),
                      // _invoice!.dateinstall_done == null && _invoice!.dateinstall_task == null
                      //     ? //تم التركيب
                      //     Form(
                      //         key: _globalKey,
                      //         child: Row(
                      //           children: [
                      //             //  SizedBox(width: 3,),
                      //             Flexible(
                      //               child: TextFormField(
                      //                 validator: (value) {
                      //                   if (_currentDate == DateTime(1, 1, 1)) {
                      //                     return 'يرجى تعيين التاريخ ';
                      //                   }
                      //                 },
                      //                 decoration: InputDecoration(
                      //                   prefixIcon: Icon(
                      //                     Icons.date_range,
                      //                     color: kMainColor,
                      //                   ),
                      //                   hintStyle: const TextStyle(
                      //                       color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                      //                   hintText:
                      //                       _invoice!.dateinstall_task == null && _currentDate == DateTime(1, 1, 1)
                      //                           ? 'التاريخ' //_currentDate.toString()
                      //                           : DateFormat('yyyy-MM-dd').format(_currentDate),
                      //                   //_invoice!.dateinstall_task.toString(),
                      //                   filled: true,
                      //                   fillColor: Colors.grey.shade200,
                      //                 ),
                      //                 readOnly: true,
                      //                 onTap: () {
                      //                   _selectDate(context, DateTime.now());
                      //                 },
                      //               ),
                      //             ),
                      //             SizedBox(width: 10),
                      //             Flexible(
                      //               child: TextFormField(
                      //                 validator: (value) {
                      //                   if (selectedTime == TimeOfDay(hour: -1, minute: 00)) {
                      //                     return 'يرجى تعيين الوقت ';
                      //                   }
                      //                 },
                      //                 decoration: InputDecoration(
                      //                   prefixIcon: Icon(
                      //                     Icons.date_range,
                      //                     color: kMainColor,
                      //                   ),
                      //                   hintStyle: const TextStyle(
                      //                       color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                      //                   hintText: _invoice!.dateinstall_task == null &&
                      //                           selectedTime == TimeOfDay(hour: -1, minute: 00)
                      //                       ? 'الوقت ' //_currentDate.toString()
                      //                       : selectedTime.minute.toString() +
                      //                           ' : ' +
                      //                           selectedTime.hour.toInt().toString(),
                      //                   //_invoice!.dateinstall_task.toString(),
                      //                   filled: true,
                      //                   fillColor: Colors.grey.shade200,
                      //                 ),
                      //                 // / controller: _timeController,
                      //                 readOnly: true,
                      //                 onTap: () {
                      //                   _selectTime(context, timinit);
                      //                 },
                      //               ),
                      //             ),
                      //
                      //             _invoice!.dateinstall_task == null //first time for set date for client
                      //                 ? IconButton(
                      //                     onPressed: () {
                      //                       // if( selectedTime != TimeOfDay(hour: -10, minute: 00)
                      //                       //     && _currentDate!= DateTime(1, 1, 1)) {
                      //                       if (_globalKey.currentState!.validate()) {
                      //                         _globalKey.currentState!.save();
                      //                         Provider.of<invoice_vm>(context, listen: false).setisload();
                      //                         DateTime datetask = DateTime(_currentDate.year, _currentDate.month,
                      //                             _currentDate.day, selectedTime.hour, selectedTime.minute);
                      //
                      //                         Provider.of<invoice_vm>(context, listen: false).setdate_vm({
                      //                           'dateinstall_task': datetask.toString(),
                      //                           //_invoice.dateinstall_task.toString()
                      //                           'fkusertask': Provider.of<user_vm_provider>(context, listen: false)
                      //                               .currentUser
                      //                               .idUser,
                      //                           // 'nameusertask':Provider.of<user_vm_provider>(context,listen: false)
                      //                           //     .currentUser!.nameUser,
                      //                         }, _invoice!.idInvoice).then((value) => clear());
                      //                         // _invoice!.dateinstall_task =
                      //                         //     _currentDate.toString();
                      //                         _currentDate = DateTime(1, 1, 1);
                      //                         selectedTime = TimeOfDay(hour: -1, minute: 00);
                      //                       } else {}
                      //                     },
                      //                     icon: Icon(Icons.check, size: 50, color: kMainColor))
                      //                 : Container(),
                      //             SizedBox(height: 6),
                      //           ],
                      //         ),
                      //       )
                      //     : Container(),
                      Consumer<invoice_vm>(
                        builder: (context, invoiceViewmodel, _) {
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
                                      Positioned.fill(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.file(selectedFile!, fit: BoxFit.cover),
                                      )),
                                      Positioned.fill(
                                          child: Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                if (_invoiceAttachFile?.attachFileStatus != AttachFileStatus.loading)
                                                  InkWell(
                                                    onTap: () => pickImage(),
                                                    borderRadius: BorderRadius.circular(90),
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      margin: EdgeInsets.only(top: 10, right: 15),
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey.shade50,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment: Alignment.center,
                                                      child: Icon(Icons.attachment_rounded,
                                                          color: Colors.grey.shade700, size: 20),
                                                    ),
                                                  ),
                                                InkWell(
                                                  onTap: () {
                                                    if (_invoiceAttachFile?.attachFileStatus ==
                                                        AttachFileStatus.loading) {
                                                      return;
                                                    } else if (_invoiceAttachFile?.attachFileStatus ==
                                                        AttachFileStatus.failed) {
                                                      uploadAttachedFile();
                                                      return;
                                                    } else {
                                                      uploadAttachedFile();
                                                    }
                                                  },
                                                  borderRadius: BorderRadius.circular(90),
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    margin: EdgeInsets.only(top: 10, right: 15),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child:
                                                        _invoiceAttachFile?.attachFileStatus == AttachFileStatus.loading
                                                            ? SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child: CircularProgressIndicator())
                                                            : _invoiceAttachFile?.attachFileStatus ==
                                                                    AttachFileStatus.failed
                                                                ? Icon(Icons.refresh, color: kMainColor, size: 20)
                                                                : Icon(Icons.done, color: kMainColor, size: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (_invoiceAttachFile?.attachFileStatus != AttachFileStatus.loading)
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedFile = null;
                                                    _invoiceAttachFile = _invoiceAttachFile?.copyWith(
                                                        attachFileStatus: AttachFileStatus.init);
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
                                : (_invoiceAttachFile?.fileAttach?.isNotEmpty ?? false)
                                    ? InkWell(
                                        onTap: () => AppPhotoViewer(urls: [urlfile + _invoiceAttachFile!.fileAttach!])
                                            .show(context),
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                                child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: FancyImageShimmerViewer(
                                                imageUrl: urlfile + _invoiceAttachFile!.fileAttach!,
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Row(
                                                  children: [
                                                    if (_invoiceAttachFile?.deleteAttachFileStatus !=
                                                        AttachFileStatus.loading)
                                                      InkWell(
                                                        onTap: () => pickImage(),
                                                        borderRadius: BorderRadius.circular(90),
                                                        child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          margin: EdgeInsets.only(top: 10, right: 15),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey.shade50,
                                                            shape: BoxShape.circle,
                                                          ),
                                                          alignment: Alignment.center,
                                                          child: Icon(Icons.attachment_rounded,
                                                              color: Colors.grey.shade700, size: 20),
                                                        ),
                                                      ),
                                                    InkWell(
                                                      onTap: () {
                                                        deleteFile();
                                                      },
                                                      borderRadius: BorderRadius.circular(90),
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        margin: EdgeInsets.only(top: 10, right: 15),
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey.shade50,
                                                          shape: BoxShape.circle,
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: _invoiceAttachFile?.deleteAttachFileStatus ==
                                                                AttachFileStatus.loading
                                                            ? SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child: CircularProgressIndicator(
                                                                  color: Colors.red,
                                                                ))
                                                            : Icon(
                                                                Icons.delete_rounded,
                                                                color: Colors.red,
                                                                size: 20,
                                                              ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : InkWell(
                                        borderRadius: BorderRadius.circular(15),
                                        onTap: () => pickImage(),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.attachment_rounded, color: Colors.grey.shade700, size: 35),
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
                        },
                      ),
                      SizedBox(height: 20),
                      Provider.of<privilge_vm>(context, listen: true).checkprivlge('42') == true
                          // ? _invoice!.dateinstall_task != null && _invoice!.dateinstall_done == null
                          ? ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                              onPressed: () async {
                                await showDialog<void>(context: context, builder: (context) => dialog);
                                // setState(() {
                                //   valueresoan=true;
                                //
                                // });
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
                              value: DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(_invoice!.dateinstall_done.toString()))),

                      _invoice!.dateinstall_done == null
                          ? Container()
                          : cardRow(
                              title: ' تم التركيب من قبل ', value: getnameshort(_invoice!.nameuserinstall.toString())),

                      if (nextInstallation?.date_client_visit != null)
                        cardRow(
                            title: 'تاريخ الزيارة القادمة',
                            value: DateFormat('yyyy-MM-dd HH:mm').format(nextInstallation!.date_client_visit!)),
                      cardRow(
                          title: 'عدد الزيارات التي تمت ',
                          value: datesInstallation.where((element) => element.is_done == "1").length.toString()),
                      cardRow(
                          title: 'عدد الزيارات المتبقية',
                          value: datesInstallation.where((element) => element.is_done == "0").length.toString()),

                      _invoice!.clientusername == null
                          ? Container()
                          : cardRow(title: 'يوزر العميل ', value: getnameshort(_invoice!.clientusername.toString())),
                      cardRow(title: 'حالة الفاتورة', value: _invoice!.stateclient.toString()),
                      cardRow(title: 'عنوان الفاتورة ', value: getnameshort(_invoice!.address_invoice.toString())),
//////////////////////////////////////////////////////////////////////////////////////////
                      _invoice!.daterepaly != null
                          ? cardRow(
                              title: ' تاريخ إعادة الجدولة',
                              value: DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(_invoice!.daterepaly.toString())))
                          : Container(),
                      _invoice!.daterepaly != null
                          ? cardRow(title: ' قام بإعادة الجدولة', value: _invoice!.nameuserreplay.toString())
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
                              value: DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(_invoice!.dateinstall_task.toString()))
                              // DateFormat.yMMMd().
                              // format(DateTime.parse(_invoice!.dateinstall_task.toString()))
                              )
                          : Container(),
                      _invoice!.dateinstall_task != null
                          ? cardRow(title: ' قام بجدولة التركيب ', value: _invoice!.nameusertask.toString())
                          : Container(),

                      cardRow(
                          title: 'طريقة التركيب ',
                          value: _invoice!.typeInstallation.toString() == '0' ? 'ميداني' : 'اونلاين'),

                      _invoice!.ready_install == '0'
                          ? cardRow(title: 'هل تم التركيب للعميل ', value: 'معلق')
                          : cardRow(
                              title: 'هل تم التركيب للعميل ',
                              value: _invoice!.dateinstall_done == null ? 'بالانتظار' : 'تم التركيب'),

                      _invoice!.date_readyinstall != null
                          ? cardRow(
                              title: ' تاريخ الغاء تعليق العميل ',
                              value: DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(_invoice!.date_readyinstall.toString())))
                          : Container(),
                      _invoice!.date_readyinstall != null
                          ? cardRow(
                              title: ' قام بالغاء تعليق العميل ', value: _invoice!.nameuser_ready_install.toString())
                          : Container(),
////////////////////////////////////////////////////////////////
                      _invoice!.date_not_readyinstall != null
                          ? cardRow(
                              title: ' تاريخ تعليق العميل ',
                              value: DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(_invoice!.date_not_readyinstall.toString())))
                          : Container(),
                      _invoice!.date_not_readyinstall != null
                          ? cardRow(title: ' قام بتعليق العميل ', value: _invoice!.nameuser_notready_install.toString())
                          : Container(),

                      Provider.of<privilge_vm>(context, listen: true).checkprivlge('43') == true
                          ? _invoice!.dateinstall_done == null
                              ? ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                  onPressed: () async {
                                    if (_invoice!.ready_install == '0')
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text('العميل غير جاهز للتركيب ')));
                                    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('العميل غير جاهز للتركيب ')));
                                    else {
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Directionality(
                                              textDirection: myui.TextDirection.rtl,
                                              child: AlertDialog(
                                                title: Text('التأكيد'),
                                                content: Text('هل تريد تأكيد عملية التركيب'),
                                                actions: <Widget>[
                                                  Column(
                                                    children: [
                                                      EditTextFormField(
                                                        maxline: 4,
                                                        paddcustom: EdgeInsets.all(10),
                                                        hintText: ' يوزر العميل',
                                                        obscureText: false,
                                                        controller: _textnameuserclient,
                                                        vaild: (value) {
                                                          if (value.toString().trim().isEmpty) {
                                                            return 'الحقل فارغ';
                                                          }
                                                        },
                                                      ),
                                                      SizedBox(height: 10),
                                                      Consumer<invoice_vm>(builder: (context, invoice, _) {
                                                        if (invoice.isloadingdone) {
                                                          return Center(child: CircularProgressIndicator());
                                                        }

                                                        return Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(kMainColor)),
                                                              onPressed: () {
                                                                Navigator.of(context, rootNavigator: true).pop(
                                                                    false); // dismisses only the dialog and returns false
                                                              },
                                                              child: Text('لا'),
                                                            ),
                                                            ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(kMainColor)),
                                                              onPressed: () async {
                                                               try{
                                                                 Provider.of<invoice_vm>(context, listen: false)
                                                                     .setisload();
                                                                 await Provider.of<config_vm>(context, listen: false)
                                                                     .getAllConfig();
                                                                 List<ConfigModel> _listconfg =
                                                                     Provider.of<config_vm>(context, listen: false)
                                                                         .listofconfig;
                                                                 ConfigModel peroid = _listconfg.firstWhere((element) =>
                                                                 element.name_config ==
                                                                     'period_commincation3'); //تواصل دوري
                                                                 DateTime datanext = DateTime.now();
                                                                 int peroidtime = int.parse(peroid.value_config);
                                                                 datanext = Jiffy().add(days: peroidtime).dateTime;
                                                                 print(datanext.toString());

                                                                 peroid = _listconfg.firstWhere((element) =>
                                                                 element.name_config ==
                                                                     'period_commincation2'); //تواصل دوري
                                                                 DateTime datanext_install = DateTime.now();
                                                                 peroidtime = int.parse(peroid.value_config);
                                                                 datanext_install =
                                                                     Jiffy().add(days: peroidtime).dateTime;
                                                                 print(datanext.toString());
                                                                 await Provider.of<invoice_vm>(context, listen: false)
                                                                     .setdatedone_vm({
                                                                   'clientusername': _textnameuserclient.text,
                                                                   'datanext': datanext.toString(),
                                                                   'datanext_install': datanext_install.toString(),
                                                                   'dateinstall_done': DateTime.now().toString(),
                                                                   'userinstall': Provider.of<user_vm_provider>(context,
                                                                       listen: false)
                                                                       .currentUser
                                                                       .idUser
                                                                       .toString(),
                                                                   'isdoneinstall': '1',
                                                                   'fkIdClient': _invoice!.fkIdClient,
                                                                   'nameuserinstall': Provider.of<user_vm_provider>(
                                                                       context,
                                                                       listen: false)
                                                                       .currentUser
                                                                       .nameUser
                                                                       .toString(),
                                                                   'name_enterprise': _invoice!.name_enterprise,
                                                                   'fkcountry': _invoice!.fk_country,
                                                                   'fk_regoin': _invoice!.fk_regoin
                                                                 }, _invoice!.idInvoice).then((value) {
                                                                   if (value) {
                                                                     clear();
                                                                     Navigator.of(context, rootNavigator: true)
                                                                         .pop(true);
                                                                   } else {
                                                                     ScaffoldMessenger.of(context).showSnackBar(
                                                                         SnackBar(content: Text('حدث خطأ ما.')));
                                                                   }
                                                                 });
                                                               }catch(e){

                                                                 ScaffoldMessenger.of(context).showSnackBar(
                                                                     SnackBar(content: Text('حدث خطأ ما.')));
                                                                 Provider.of<invoice_vm>(context, listen: false)
                                                                     .setisload(isLoading: false);
                                                               }
                                                              },
                                                              child: Text('نعم'),
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

                      _invoice!.dateinstall_done != null
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Provider.of<privilge_vm>(context, listen: true).checkprivlge('110') == true
                                    ? ElevatedButton(
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                        onPressed: _invoice!.ready_install == '1'
                                            ? null
                                            : () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return ModalProgressHUD(
                                                      inAsyncCall:
                                                          Provider.of<invoice_vm>(context, listen: true).isloadingdone,
                                                      child: Directionality(
                                                        textDirection: myui.TextDirection.rtl,
                                                        child: AlertDialog(
                                                          title: Text('التأكيد'),
                                                          content: Text('هل تريد تحويل العميل إلى جاهز للتركيب '),
                                                          actions: <Widget>[
                                                            Column(
                                                              children: [
                                                                SizedBox(height: 10),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty.all(kMainColor)),
                                                                      onPressed: () {
                                                                        Navigator.of(context, rootNavigator: true).pop(
                                                                            false); // dismisses only the dialog and returns false
                                                                      },
                                                                      child: Text('لا'),
                                                                    ),
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty.all(kMainColor)),
                                                                      onPressed: () async {
                                                                        Provider.of<invoice_vm>(context, listen: false)
                                                                            .setisload();

                                                                        await Provider.of<invoice_vm>(context,
                                                                                listen: false)
                                                                            .set_ready_install({
                                                                          'date_temp': _invoice!.date_not_readyinstall
                                                                              .toString(),
                                                                          'date_ready_prev':
                                                                              _invoice!.date_readyinstall.toString(),
                                                                          'date_readyinstall':
                                                                              DateTime.now().toString(),
                                                                          'user_ready_install':
                                                                              Provider.of<user_vm_provider>(context,
                                                                                      listen: false)
                                                                                  .currentUser
                                                                                  .idUser
                                                                                  .toString(),
                                                                          'ready_install': '1',
                                                                        }, _invoice!.idInvoice).then(
                                                                                (value) => clear());
                                                                        Navigator.of(context, rootNavigator: true)
                                                                            .pop(true);
                                                                      },
                                                                      child: Text('نعم'),
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
                                        child: Text('جاهز للتركيب'))
                                    : Container(),
                                Provider.of<privilge_vm>(context, listen: true).checkprivlge('109') == true
                                    ? ElevatedButton(
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                        onPressed: _invoice!.ready_install == '0'
                                            ? null
                                            : () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return ModalProgressHUD(
                                                      inAsyncCall:
                                                          Provider.of<invoice_vm>(context, listen: true).isloadingdone,
                                                      child: Directionality(
                                                        textDirection: myui.TextDirection.rtl,
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
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty.all(kMainColor)),
                                                                      onPressed: () {
                                                                        Navigator.of(context, rootNavigator: true).pop(
                                                                            false); // dismisses only the dialog and returns false
                                                                      },
                                                                      child: Text('لا'),
                                                                    ),
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty.all(kMainColor)),
                                                                      onPressed: () async {
                                                                        Provider.of<invoice_vm>(context, listen: false)
                                                                            .setisload();

                                                                        var body = {
                                                                          // _invoice.date_not_readyinstall-
                                                                          'date_temp': _invoice!.date_not_readyinstall
                                                                              .toString(),
                                                                          'date_ready_prev':
                                                                              _invoice!.date_readyinstall.toString(),
                                                                          'date_not_readyinstall':
                                                                              DateTime.now().toString(),
                                                                          'user_not_ready_install':
                                                                              Provider.of<user_vm_provider>(context,
                                                                                      listen: false)
                                                                                  .currentUser
                                                                                  .idUser
                                                                                  .toString(),
                                                                          'ready_install': '0', //suspend client
                                                                        };
                                                                        if (_invoice!.count_delay_ready != null)
                                                                          body.addAll({
                                                                            'count_delay_ready':
                                                                                _invoice!.count_delay_ready.toString(),
                                                                          });

                                                                        await Provider.of<invoice_vm>(context,
                                                                                listen: false)
                                                                            .set_ready_install(
                                                                                body, _invoice!.idInvoice)
                                                                            .then((value) => clear());
                                                                        Navigator.of(context, rootNavigator: true)
                                                                            .pop(true);
                                                                      },
                                                                      child: Text('نعم'),
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
                                        child: Text('غير جاهز للتركيب'))
                                    : Container(),
                              ],
                            ),
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }

  late DateTime _currentDate = DateTime(1, 1, 1);

  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);
  late double _height;
  late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  Future<Null> _selectTime(BuildContext context, TimeOfDay stime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: stime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = selectedTime.toString();
        print('ssdsds');
        print(TimeOfDay.now());
        print(selectedTime.toString());
        // Utils.toTime(selectedTime)
        // formatDate(
        // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        // [hh, ':', nn, " ", am]).toString();
      });
    Provider.of<datetime_vm>(context, listen: false).setdatetimevalue(_currentDate, selectedTime);
  }

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    //String output = formatter.format(currentDate);
    // DateFormat('yyyy-MM-dd – kk:mm').format(now);
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        // _invoice.dateinstall_task=pickedDate.toString() ;
        _currentDate = pickedDate;
        print(_currentDate.toString());

        final time =
            Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute, seconds: DateTime.now().second);
        print('timme');
        print(DateFormat.Hms().format(_currentDate));
        _currentDate.add(Duration(hours: DateTime.now().hour));
        print(time.toString());
        print(_currentDate.toString());
        // _currentDate.add(Duration(hours: selectedTime.hour));

        // _invoice!.dateinstall_task = _currentDate.toString();
        //_invoice!.daterepaly = _currentDate.toString();
        //_currentDate.hour=DateTime.now().hour;
      });
    Provider.of<datetime_vm>(context, listen: false).setdatetimevalue(_currentDate, selectedTime);
  }

  clear() {
    _currentDate = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));

    // setState(() {
    //  });
  }

  clear2() {
    Navigator.of(context, rootNavigator: true).pop(false);
    _currentDate = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('تم التثبيت بنجاح')));
  }

  error() {
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('يوجد مشكلة ما  ')));
  }

  pickImage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(
        onPickFile: (context, file) {
          selectedFile = file;
          _invoiceAttachFile = _invoiceAttachFile?.copyWith(attachFileStatus: AttachFileStatus.init);
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
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(attachFileStatus: AttachFileStatus.loading);
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
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(attachFileStatus: AttachFileStatus.failed);
            setState(() {});
          },
        );
  }

  deleteFile() {
    context.read<invoice_vm>().deleteFile(
          idInvoice: _invoiceAttachFile!.idInvoice!,
          onLoading: () {
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(deleteAttachFileStatus: AttachFileStatus.loading);
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
            _invoiceAttachFile = _invoiceAttachFile?.copyWith(deleteAttachFileStatus: AttachFileStatus.failed);
            setState(() {});
          },
        );
  }
}
