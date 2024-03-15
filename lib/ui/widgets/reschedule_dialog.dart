import 'dart:ui' as myui;

import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/utils/app_strings.dart';
import '../../features/app/presentation/widgets/app_elvated_button.dart';
import '../../model/calendar/event_model.dart';
import '../../model/invoiceModel.dart';
import '../screen/support/support_add.dart';
import '../screen/support/support_table.dart';
import 'custom_widget/row_edit.dart';
import 'custom_widget/text_form.dart';

class ReScheduleDialog extends StatefulWidget {
  final String idClientsDate;
  final String idinvoice;
  final String idClient;
  final DateTime time_from;
  final DateTime time_to;
  final DateTime datecurrent;
  final String typedate;

  // todo : use this event model to show the current user
  final EventModel event;

  ReScheduleDialog({
    Key? key,
    required this.event,
    required this.idClientsDate,
    required this.idinvoice,
    required this.idClient,
    required this.time_from,
    required this.time_to,
    required this.datecurrent,
    required this.typedate,
  }) : super(key: key);

  @override
  State<ReScheduleDialog> createState() => _ReScheduleDialogState();
}

class _ReScheduleDialogState extends State<ReScheduleDialog> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController descresaonController = TextEditingController();
  late EventProvider _eventProvider;
  TimeOfDay selectedStartTime = TimeOfDay(hour: -1, minute: 00);
  late DateTime _currentDate = DateTime(1, 1, 1);
  TimeOfDay endTime = TimeOfDay(hour: -1, minute: 00);

  late String _hour, _minute, _time;
  TextEditingController _timeController = TextEditingController();
  late TimeOfDay timinit;
  late TimeOfDay timinit2;
  List<DateInstallationClient> datesInstallation = [];
  List<String> listInstallationType = [
    'ميداني',
    'اونلاين',
  ];
  late String? selectInstallationType;

  bool isInit = true;

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: widget.time_from,
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
        .setdatetimevalue(_currentDate, selectedStartTime);
  }

  Future<Null> _selectTime(BuildContext context, TimeOfDay stime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: stime,
    );
    if (picked == null) return;
    final startTime = DateTime(
      _currentDate.year,
      _currentDate.month,
      _currentDate.day,
      picked.hour,
      picked.minute,
    );

    final endTime = DateTime(
      _currentDate.year,
      _currentDate.month,
      _currentDate.day,
      this.endTime.hour,
      this.endTime.minute,
    );

    if (startTime.isAfter(endTime)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا يمكن أن يكون وقت البداية بعد وقت النهاية'),
        ),
      );
      return;
    }

    setState(() {
      selectedStartTime = picked;
      _hour = selectedStartTime.hour.toString();
      _minute = selectedStartTime.minute.toString();
      _time = _hour + ' : ' + _minute;
      _timeController.text = _time;
      _timeController.text = selectedStartTime.toString();
    });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(_currentDate, selectedStartTime);
  }

  Future<Null> _selectEndTime(BuildContext context, TimeOfDay stime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: stime,
    );
    if (picked == null) return;
    final end = DateTime(
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
      selectedStartTime.hour,
      selectedStartTime.minute,
    );

    if (end.isBefore(startTime)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا يمكن أن يكون وقت النهاية قبل وقت البداية'),
        ),
      );
      return;
    }

    setState(() {
      endTime = picked;
      _hour = endTime.hour.toString();
      _minute = endTime.minute.toString();
      _time = _hour + ' : ' + _minute;
    });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalueEnd(_currentDate, endTime);
  }

  clear() {
    selectedStartTime = TimeOfDay(hour: -1, minute: 00);
    endTime = TimeOfDay(hour: -1, minute: 00);

    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue(DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    Provider.of<datetime_vm>(context, listen: false).setdatetimevalueEnd(
        DateTime(1, 1, 1), TimeOfDay(hour: -1, minute: 00));
    selectInstallationType = null;
    selectInstallationType = null;
    // setState(() {
    //  });
  }

  void initState() {
    selectInstallationType = null;
    _currentDate = widget.datecurrent;
    selectedStartTime = TimeOfDay.fromDateTime(widget.time_from);
    endTime = TimeOfDay.fromDateTime(widget.time_to);
    timinit = TimeOfDay.fromDateTime(widget.time_from);
    timinit2 = TimeOfDay.fromDateTime(widget.time_to);
    _eventProvider = context.read<EventProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(_currentDate, selectedStartTime);
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalueEnd(_currentDate, endTime);
    });
    setState(() {
      selectInstallationType = widget.typedate;
    });

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
              selectedStartTime == TimeOfDay(hour: -1, minute: 00);
              return Directionality(
                textDirection: myui.TextDirection.rtl,
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (selectedStartTime ==
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
                                hintText: Provider.of<datetime_vm>(context,
                                                listen: true)
                                            .selectedStartTime ==
                                        null
                                    ? 'الوقت ' //_currentDate.toString()
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
                                  _selectTime(context, timinit);
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
                                hintText: Provider.of<datetime_vm>(context,
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
                                  _selectEndTime(context, timinit2);
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
                            selectInstallationType = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      RowEdit(name: "اسناد الي", des: '*'),
                      TechSupportUsersDropDown(fkUser: widget.event.fkUser),
                      SizedBox(height: 15),
                      RowEdit(name: "تحديد الأسباب", des: '*'),
                      EditTextFormField(
                        vaildator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.labelEmpty;
                          }
                          return null;
                        },
                        hintText: "تحديد الأسباب",
                        paddcustom: EdgeInsets.all(8),
                        maxline: 5,
                        controller: descresaonController,
                      ),
                      SizedBox(height: 10),
                      Consumer<EventProvider>(builder: (context, val, _) {
                        return AppElevatedButton(
                          isLoading: val.isloadingRescheduleOrCancel,
                          text: "حفظ",
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                          ),
                          onPressed: () async {
                            if (selectInstallationType == null ||
                                selectInstallationType!.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('من فضلك اختر نوع التركيب ')));
                              return;
                            }

                            if (_globalKey.currentState!.validate()) {
                              // Navigator.of(context, rootNavigator: true).pop(false);
                              _globalKey.currentState!.save();

                              Provider.of<invoice_vm>(context, listen: false)
                                  .setisload();
                              DateTime datetask = DateTime(
                                  _currentDate.year,
                                  _currentDate.month,
                                  _currentDate.day,
                                  selectedStartTime.hour,
                                  selectedStartTime.minute);
                              DateTime date_end = DateTime(
                                  _currentDate.year,
                                  _currentDate.month,
                                  _currentDate.day,
                                  endTime.hour,
                                  endTime.minute);

                              final EventModel editedEvent =
                                  widget.event.copyWith(
                                isDone: "3",
                                from: datetask,
                                to: date_end,
                                typedate: selectInstallationType,
                              );
                              String? assignedTo = iduser;
                              if (assignedTo == null) {
                                assignedTo = widget.event.fkUser;
                              }

                              await Provider.of<EventProvider>(context,
                                      listen: false)
                                  .editSchedule_vm(
                                scheduleId: widget.idClientsDate,
                                dateClientVisit: datetask,
                                date_end: date_end,
                                fk_user: iduser,
                                event: widget.event,
                                typeDate: selectInstallationType!,
                                processReason: descresaonController.text,
                                onFailure: (void value) {},
                                onSuccess: (value) {
                                  _eventProvider.editEvent(
                                    editedEvent,
                                    widget.event,
                                  );
                                },
                              );
                              AppNavigator.pop(result: editedEvent);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "تمت عملية إعادة الجدولة الزيارة  ",
                                          textDirection:
                                              myui.TextDirection.rtl)));
                              // clear();
                              setState(() {});
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
