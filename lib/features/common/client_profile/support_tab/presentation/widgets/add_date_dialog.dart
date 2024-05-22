import 'dart:ui' as myui;

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';

class AddDateDialog extends StatefulWidget {
  const AddDateDialog({
    super.key,
    required this.list_installation_type,
    required this.idClient,
    required this.invoiceModel,
    required this.datesInstallation,
  });

  final List<String> list_installation_type;
  final String idClient;
  final InvoiceModel invoiceModel;
  final List<DateInstallationClient> datesInstallation;

  @override
  State<AddDateDialog> createState() => _AddDateDialogState();
}

class _AddDateDialogState extends State<AddDateDialog> {
  late final SupportTabCubit supportTabCubit;
  final _globalKey = GlobalKey<FormState>();
  DateTime _currentDate = DateTime(1, 1, 1);
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);
  TimeOfDay endTime = TimeOfDay(hour: -1, minute: 00);
  late String selectInstallationType;
  String? Value_installation_type;
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _endtimeController = TextEditingController();
  DateTime valuedateTime = DateTime(1, 1, 1);
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  @override
  void initState() {
    supportTabCubit = context.read<SupportTabCubit>();
    selectInstallationType = widget.list_installation_type.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // the box that receive min width is >>
    return SimpleDialog(
        titlePadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        contentPadding: EdgeInsets.all(15),
        title: Center(
            child: Text('إضافة موعد جديد',
                style: TextStyle(
                  fontFamily: kfontfamily2,
                ))),
        children: [
          StatefulBuilder(
            builder: (context, refresh) {
              selectedTime == TimeOfDay(hour: -1, minute: 00);
              endTime == TimeOfDay(hour: -1, minute: 00);
              return Directionality(
                textDirection: myui.TextDirection.rtl,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
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
                            hintText: valuedateTime == DateTime(1, 1, 1)
                                ? 'تعيين التاريخ'
                                : DateFormat('yyyy-MM-dd')
                                    .format(valuedateTime),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          readOnly: true,
                          onTap: () async {
                            await _selectDate(context);
                            if (context.mounted) refresh(() {});
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
                                  hintText: selectedStartTime == null
                                      ? 'بداية الزيارة'
                                      : selectedStartTime!.minute.toString() +
                                          ' : ' +
                                          selectedStartTime!.hour
                                              .toInt()
                                              .toString(),
                                  //_invoice!.dateinstall_task.toString(),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                ),
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
                                  hintText: selectedEndTime == null
                                      ? 'نهاية الزيارة ' //_currentDate.toString()
                                      : selectedEndTime!.minute.toString() +
                                          ' : ' +
                                          selectedEndTime!.hour
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
                        SizedBox(height: 15),
                        RowEdit(name: "نوع التركيب", des: '*'),
                        DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('نوع التركيب'),
                          items: widget.list_installation_type.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one),
                              value: level_one,
                            );
                          }).toList(),
                          value: selectInstallationType,
                          onChanged: (value) {
                            selectInstallationType = value.toString();
                            Value_installation_type = value.toString();
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 10),
                        RowEdit(name: "اسناد الي", des: '*'),
                        SizedBox(height: 10),
                        TechSupportUsersDropDown(clear: true),
                        SizedBox(height: 15),
                        // save button
                        BlocBuilder<SupportTabCubit, SupportTabState>(
                          builder: (context, state) {
                            return AppElevatedButton(
                              isLoading: state.addDateInstallStatus.isLoading,
                              text: "حفظ",
                              onPressed: () async {
                                if (Value_installation_type == null ||
                                    Value_installation_type!.isEmpty) {
                                  AppConstants.showSnakeBar(
                                      context, 'من فضلك اختر نوع التركيب ');
                                }
                                if (_globalKey.currentState!.validate()) {
                                  _globalKey.currentState!.save();
                                  final startDate = _currentDate;
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

                                  await supportTabCubit
                                      .addDateInstall(AddDateInstallParams(
                                    idInvoice: widget.invoiceModel.idInvoice,
                                    fkUser: supportTabCubit.iduser,
                                    dateClientVisit: datetask.toString(),
                                    dateEnd: date_end.toString(),
                                    typeDate: Value_installation_type!,
                                  ));

                                  DateTime temp = datetask.hour >= 21
                                      ? datetask.subtract(Duration(hours: 3))
                                      : datetask;

                                  final event = EventModel(
                                    fkIdClient: widget.idClient,
                                    idinvoice: widget.invoiceModel.idInvoice!,
                                    title: widget.invoiceModel.name_enterprise!,
                                    description: "description",
                                    from: temp,
                                    to: temp.add(Duration(hours: 2)),
                                    typedate: '',
                                  );

                                  if (context.mounted) {
                                    Provider.of<EventProvider>(context,
                                            listen: false)
                                        .addEvent(event);
                                  }

                                  widget.datesInstallation
                                      .add(DateInstallationClient(
                                    dateClientVisit: datetask,
                                    fkUser: supportTabCubit.iduser,
                                    fkClient: widget.idClient,
                                    isDone: '0',
                                    fkInvoice: widget.invoiceModel.idInvoice,
                                  ));

                                  setState(() {});

                                  _currentDate = DateTime(1, 1, 1);
                                  selectedTime =
                                      TimeOfDay(hour: -1, minute: 00);
                                  AppNavigator.pop();
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ]);
  }

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked == null) return;

    if (selectedEndTime != null) {
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
        selectedEndTime!.hour,
        selectedEndTime!.minute,
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
      final _hour = selectedTime.hour.toString();
      final _minute = selectedTime.minute.toString();
      final _time = _hour + ' : ' + _minute;
      _timeController.text = _time;
      _timeController.text = selectedTime.toString();
    });
    setdatetimevalue(_currentDate, selectedTime);
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked == null) return;

    if (selectedStartTime != null) {
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
        selectedStartTime!.hour,
        selectedStartTime!.minute,
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
      final _hour = endTime.hour.toString();
      final _minute = endTime.minute.toString();
      final _time = _hour + ' : ' + _minute;
      _endtimeController.text = _time;
      _endtimeController.text = endTime.toString();
      selectedEndTime = endTime;
    });
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
    setdatetimevalue(_currentDate, null);
  }

  void setdatetimevalue(DateTime val, TimeOfDay? timeday) {
    valuedateTime = val;
    selectedStartTime = timeday;
    setState(() {});
  }

  @override
  void dispose() {
    _timeController.dispose();
    _endtimeController.dispose();
    valuedateTime = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    selectedStartTime = null;
    selectedEndTime = null;
    selectInstallationType = widget.list_installation_type.first;
    Value_installation_type = null;
    super.dispose();
  }
}
