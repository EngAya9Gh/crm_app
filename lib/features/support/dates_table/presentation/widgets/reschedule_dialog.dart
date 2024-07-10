import 'dart:ui' as myui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/type_process_date.dart';
import '../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../../../../ui/widgets/custom_widget/row_edit.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../view_model/datetime_vm.dart';
import '../../../../../view_model/invoice_vm.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../manager/dates_table_cubit.dart';

class ReScheduleDialog extends StatefulWidget {
  final EventModel event;

  ReScheduleDialog({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<ReScheduleDialog> createState() => _ReScheduleDialogState();
}

class _ReScheduleDialogState extends State<ReScheduleDialog> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController descresaonController = TextEditingController();
  TimeOfDay selectedStartTime = TimeOfDay(hour: -1, minute: 00);
  late DateTime _currentDate = DateTime(1, 1, 1);
  TimeOfDay endTime = TimeOfDay(hour: -1, minute: 00);

  late String _hour, _minute, _time;
  TextEditingController _timeController = TextEditingController();
  late TimeOfDay timinit;
  late TimeOfDay timinit2;
  List<String> listInstallationType = [
    'ميداني',
    'اونلاين',
  ];
  late String? selectInstallationType;

  late final DatesTableCubit datesTableCubit;
  DateTime? dateTask;
  DateTime? dateEnd;
  EventModel? editedEvent;

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: widget.event.from,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;
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

  void initState() {
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    datesTableCubit.changedIdUser = widget.event.fkUser;
    selectInstallationType = null;
    _currentDate = widget.event.from;
    selectedStartTime = TimeOfDay.fromDateTime(widget.event.from);
    endTime = TimeOfDay.fromDateTime(widget.event.to);
    timinit = TimeOfDay.fromDateTime(widget.event.from);
    timinit2 = TimeOfDay.fromDateTime(widget.event.to);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(_currentDate, selectedStartTime);
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalueEnd(_currentDate, endTime);
    });
    setState(() {
      selectInstallationType = widget.event.typeDate;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      TechSupportUsersDropDown(
                        fkUser: widget.event.fkUser,
                        onSelectUser: (user) {
                          datesTableCubit.changedIdUser = user.idUser;
                        },
                      ),
                      SizedBox(height: 15),
                      RowEdit(name: "تحديد الأسباب", des: '*'),
                      EditTextFormField(
                        vaildator: (value) {
                          return InputValidator.requiredFiled(value);
                        },
                        hintText: "تحديد الأسباب",
                        paddcustom: EdgeInsets.all(8),
                        maxline: 5,
                        controller: descresaonController,
                      ),
                      SizedBox(height: 10),
                      BlocConsumer<DatesTableCubit, DatesTableState>(
                        listenWhen: (previous, current) {
                          return current.rescheduleDateStatus !=
                              previous.rescheduleDateStatus;
                        },
                        listener: (context, state) {
                          handleAddDateStates(
                            context: context,
                            state: state.rescheduleDateStatus,
                            onPressed: () async {
                              AppNavigator.pop();
                              await datesTableCubit.rescheduleDate(
                                RescheduleDateParams(
                                  scheduleId: widget.event.idClientsDate!,
                                  dateClientVisit: dateTask!,
                                  dateEnd: dateEnd!,
                                  fkUser: datesTableCubit.changedIdUser!,
                                  typeDate: selectInstallationType!,
                                  processReason: descresaonController.text,
                                  typeProcess: TypeProcessDate.reschedule.value,
                                  force: 1,
                                ),
                                onSuccess: (value) {
                                  AppNavigator.pop(result: editedEvent);
                                  AppConstants.showSnakeBar(
                                    context,
                                    'تمت العملية بنجاح',
                                  );
                                  dateTask = null;
                                  dateEnd = null;
                                },
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return AppElevatedButton(
                            isLoading: state.rescheduleDateStatus.isLoading(),
                            text: "حفظ",
                            onPressed: () async {
                              if (_selectedInstallationType()) {
                                AppConstants.showSnakeBar(
                                    context, 'من فضلك اختر نوع التركيب');
                                return;
                              }

                              if (_globalKey.currentState!.validate()) {
                                // Navigator.of(context, rootNavigator: true).pop(false);
                                _globalKey.currentState!.save();

                                Provider.of<InvoiceVm>(context, listen: false)
                                    .setisload();
                                dateTask = DateTime(
                                    _currentDate.year,
                                    _currentDate.month,
                                    _currentDate.day,
                                    selectedStartTime.hour,
                                    selectedStartTime.minute);
                                dateEnd = DateTime(
                                    _currentDate.year,
                                    _currentDate.month,
                                    _currentDate.day,
                                    endTime.hour,
                                    endTime.minute);

                                String? assignedTo =
                                    datesTableCubit.changedIdUser;
                                if (assignedTo == null) {
                                  assignedTo = widget.event.fkUser;
                                }

                                editedEvent = widget.event.copyWith(
                                  isDone: "3",
                                  from: dateTask,
                                  to: dateEnd,
                                  typedate: selectInstallationType,
                                  fkUser: assignedTo,
                                  comment: descresaonController.text,
                                );

                                await datesTableCubit.rescheduleDate(
                                  RescheduleDateParams(
                                    scheduleId: widget.event.idClientsDate!,
                                    dateClientVisit: dateTask!,
                                    dateEnd: dateEnd!,
                                    fkUser: datesTableCubit.changedIdUser!,
                                    typeDate: selectInstallationType!,
                                    processReason: descresaonController.text,
                                    typeProcess:
                                        TypeProcessDate.reschedule.value,
                                  ),
                                  onSuccess: (value) {
                                    AppNavigator.pop(result: editedEvent);
                                    AppConstants.showSnakeBar(
                                      context,
                                      'تمت العملية بنجاح',
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]);
  }

  bool _selectedInstallationType() {
    return selectInstallationType == null || selectInstallationType!.isEmpty;
  }
}
