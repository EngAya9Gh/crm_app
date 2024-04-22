import 'dart:ui' as myui;

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../view_model/invoice_vm.dart';

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

  @override
  void initState() {
    supportTabCubit = context.read<SupportTabCubit>();
    selectInstallationType = widget.list_installation_type.first;

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
                              Provider.of<datetime_vm>(context, listen: true)
                                          .valuedateTime ==
                                      DateTime(1, 1, 1)
                                  ? 'تعيين التاريخ' //_currentDate.toString()
                                  : DateFormat('yyyy-MM-dd').format(
                                      Provider.of<datetime_vm>(context,
                                              listen: true)
                                          .valuedateTime,
                                    ),
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
                                hintText: Provider.of<datetime_vm>(context,
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
                        items: widget.list_installation_type.map((level_one) {
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
                              .refresh();
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
                              fkUser: iduser,
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

                            Provider.of<EventProvider>(context, listen: false)
                                .addEvent(event);

                            widget.datesInstallation.add(DateInstallationClient(
                              dateClientVisit: datetask,
                              fkUser: iduser,
                              fkClient: widget.idClient,
                              isDone: '0',
                              fkInvoice: widget.invoiceModel.idInvoice,
                            ));

                            setState(() {});

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
  }

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
      final _hour = selectedTime.hour.toString();
      final _minute = selectedTime.minute.toString();
      final _time = _hour + ' : ' + _minute;
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
      final _hour = endTime.hour.toString();
      final _minute = endTime.minute.toString();
      final _time = _hour + ' : ' + _minute;
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

  @override
  void dispose() {
    _timeController.dispose();
    _endtimeController.dispose();
    super.dispose();
  }
}
