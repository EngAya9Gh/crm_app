import 'dart:ui' as myui;

import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/utils/app_strings.dart';
import '../../model/calendar/event.dart';
import '../../model/invoiceModel.dart';
import 'custom_widget/custombutton.dart';
import 'custom_widget/row_edit.dart';
import 'custom_widget/text_form.dart';

class ReScheduleDialog extends StatefulWidget {
  final String idClientsDate;
  final String idinvoice;
  final String idClient;

  final Event event;
  ReScheduleDialog(
      {Key? key,
      required this.event,
      required this.idClientsDate,
      required this.idinvoice,
      required this.idClient})
      : super(key: key);

  @override
  State<ReScheduleDialog> createState() => _ReScheduleDialogState();
}

class _ReScheduleDialogState extends State<ReScheduleDialog> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController descresaonController = TextEditingController();
  late EventProvider _eventProvider;
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);
  late DateTime _currentDate = DateTime(1, 1, 1);

  late String _hour, _minute, _time;
  TextEditingController _timeController = TextEditingController();
  late TimeOfDay timinit;
  List<DateInstallationClient> datesInstallation = [];
  List<String> listInstallationType = [
    'ميداني',
    'اونلاين',
  ];
  late String? selectInstallationType;
  String? valueInstallationType = null;

  bool isInit = true;
  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;
        final time = Duration(
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second);
        _currentDate.add(Duration(hours: DateTime.now().hour));
      });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(_currentDate, selectedTime);
  }

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

        // Utils.toTime(selectedTime)
        // formatDate(
        // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        // [hh, ':', nn, " ", am]).toString();
      });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(_currentDate, selectedTime);
  }

  clear() {
    _currentDate = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    selectInstallationType = null;
    valueInstallationType = null;
    // setState(() {
    //  });
  }

  void initState() {
    timinit = TimeOfDay.now();
    _eventProvider = context.read<EventProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    });

    selectInstallationType = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      isInit = false;
    }
    return SimpleDialog(
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
                                hintStyle: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                hintText:
                                    // _invoice!.daterepaly == null
                                    //     &&
                                    Provider.of<datetime_vm>(context,
                                                    listen: true)
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
                                  _selectDate(context, DateTime.now());
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
                                if (selectedTime ==
                                    TimeOfDay(hour: -1, minute: 00)) {
                                  return 'يرجى تعيين الوقت ';
                                }
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
                                hintText: Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedTime ==
                                        TimeOfDay(hour: -1, minute: 00)
                                    ? 'الوقت ' //_currentDate.toString()
                                    : Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedTime
                                            .minute
                                            .toString() +
                                        ' : ' +
                                        Provider.of<datetime_vm>(context,
                                                listen: true)
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
                      SizedBox(height: 10),
                      RowEdit(name: "نوع التركيب", des: '*'),
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('نوع التركيب'),
                        items: listInstallationType.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one),
                            value: level_one,
                          );
                        }).toList(),
                        value: selectInstallationType == null
                            ? null
                            : selectInstallationType,
                        onChanged: (value) {
                          setState(() {
                            selectInstallationType = value.toString();
                            valueInstallationType = value.toString();
                          });
                          Provider.of<datetime_vm>(context, listen: false)
                              .notifyListeners();
                        },
                      ),
                      SizedBox(height: 10),
                      RowEdit(name: "تحديد الأسباب", des: '*'),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.labelEmpty;
                          }
                        },
                        hintText: "تحديد الأسباب",
                        paddcustom: EdgeInsets.all(8),
                        maxline: 5,
                        controller: descresaonController,
                      ),
                      SizedBox(height: 10),
                      Consumer<invoice_vm>(builder: (context, val, _) {
                        if (val.isloadingRescheduleOrCancel)
                          return Center(child: CircularProgressIndicator());
                        else
                          return CustomButton(
                            text: "حفظ",
                            onTap: () async {
                              if (valueInstallationType == null ||
                                  valueInstallationType!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('من فضلك اختر نوع التركيب ')));
                                return;
                              }
                              DateTime datetask = DateTime(
                                  _currentDate.year,
                                  _currentDate.month,
                                  _currentDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute);
                              if (_globalKey.currentState!.validate()) {
                                // Navigator.of(context, rootNavigator: true).pop(false);
                                _globalKey.currentState!.save();

                                Provider.of<invoice_vm>(context, listen: false)
                                    .setisload();
                                DateTime datetask = DateTime(
                                    _currentDate.year,
                                    _currentDate.month,
                                    _currentDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute);

                                final idUser = Provider.of<UserProvider>(
                                        context,
                                        listen: false)
                                    .currentUser
                                    .idUser;
                                Provider.of<invoice_vm>(context, listen: false)
                                    .editSchedule_vm(
                                  scheduleId: widget.idClientsDate,
                                  dateClientVisit: datetask.toString(),
                                  typeDate: valueInstallationType!,
                                  processReason: descresaonController.text,
                                  onSuccess: (value) {
                                    DateTime temp = datetask.hour >= 21
                                        ? datetask.subtract(Duration(hours: 3))
                                        : datetask;
                                    _eventProvider.editEvent(
                                        widget.event.copyWith(
                                          isDone: "3",
                                          // from: temp,
                                          // to: temp.add(Duration(hours: 2))
                                        ),
                                        widget.event);
                                  },
                                )
                                    .then((value) {
                                  //  Navigator.of(context, rootNavigator: true).pop(false);
                                  Navigator.pop(context, true);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "تمت عملية إعادة الجدولة الزيارة  ",
                                              textDirection:
                                                  myui.TextDirection.rtl)));
                                  clear();

                                  // datesInstallation.add(DateInstallationClient(
                                  //   date_client_visit: datetask,
                                  //   fk_user: idUser,
                                  //   fk_client: widget.idClient,
                                  //   is_done: '0',
                                  //   fk_invoice: widget.invoice!.idInvoice,
                                  // ));

                                  setState(() {});
                                });
                                _currentDate = DateTime(1, 1, 1);
                                selectedTime = TimeOfDay(hour: -1, minute: 00);
                              }
                            },
                          );
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ]);
  }
}
