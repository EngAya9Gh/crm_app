import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/enums/type_process_date.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../view_model/datetime_vm.dart';
import '../../../../../view_model/invoice_vm.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../manager/dates_table_cubit.dart';

class ReScheduleDialog extends StatefulWidget {
  final EventModel event;

  ReScheduleDialog({
    super.key,
    required this.event,
  });

  @override
  State<ReScheduleDialog> createState() => _ReScheduleDialogState();
}

class _ReScheduleDialogState extends State<ReScheduleDialog> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController descresaonController = TextEditingController();
  TimeOfDay selectedStartTime = TimeOfDay(hour: -1, minute: 00);
  late DateTime _currentDate = DateTime(1, 1, 1);
  TimeOfDay? endTime= TimeOfDay(hour: -1, minute: 00);

  late String _hour, _minute, _time;
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

  bool _isSmsChecked = false; // Add this line

  Future<void> _selectDate(
    BuildContext context,
    DateTime currentDate,
    DateTime? pickedDate,
  ) async {
    print("picked data is => $pickedDate");
    if (pickedDate != null)
        _currentDate = pickedDate;
        print("current date is 11=> ${_currentDate}");
        _currentDate.add(Duration(hours: DateTime.now().hour));
        print("current date is => ${_currentDate}");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(_currentDate, selectedStartTime);
    });

  }

  Future<Null> _selectTime(
    BuildContext context,
    TimeOfDay? picked,
  ) async {
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
      this.endTime!.hour,
      this.endTime!.minute,
    );

    if (startTime.isAfter(endTime) || startTime.isAtSameMomentAs(endTime)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar.showSnakeBar('لا يمكن أن يكون وقت النهاية قبل وقت البداية');
      });
      return;
    }

        selectedStartTime = picked;
        _hour = selectedStartTime.hour.toString();
        _minute = selectedStartTime.minute.toString();
        _time = _hour + ' : ' + _minute;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue(_currentDate, selectedStartTime);
    });
  }

  Future<Null> _selectEndTime(
    BuildContext context,
    TimeOfDay? picked,
  ) async {
    if (picked == null) return;

    endTime = picked;

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

    if (end.isBefore(startTime) || end.isAtSameMomentAs(startTime)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar.showSnakeBar('لا يمكن أن يكون وقت النهاية قبل وقت البداية');
      });
      return;
    }

      endTime = picked;
      if(endTime!=null){
        _hour = endTime!.hour.toString();
        _minute = endTime!.minute.toString();
        _time = _hour + ' : ' + _minute;
      }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalueEnd(_currentDate, endTime);
    });

  }

  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

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
      selectInstallationType = widget.event.typeDate;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(title: 'إعادة جدولة', children: [
      Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDateTimePicker(
                dateTimeType: DateTimeEnum.date,
                dateTimeController: dateController,
                onDateChange: (dateTime, formattedDate) {
                  _selectDate(context, DateTime.now(), dateTime);
                },
                style2: true,
              ),
              10.height,
              Row(
                children: [
                  Flexible(
                    child: CustomDateTimePicker(
                      dateTimeType: DateTimeEnum.time,
                      hintText: 'وقت البداية',
                      dateTimeController: startTimeController,
                      onTimeChange: (dateTime, formattedDate) {
                        if(selectedStartTime != dateTime){
                          _selectTime(context, dateTime);
                        }
                      },
                      style2: true,
                    ),
                  ),
                  10.width,
                  Flexible(
                    child: CustomDateTimePicker(
                      dateTimeType: DateTimeEnum.time,
                      hintText: 'وقت النهاية',
                      dateTimeController: endTimeController,
                      onTimeChange: (dateTime, formattedDate) {
                        if(endTime != dateTime){
                          _selectEndTime(context, dateTime);
                        }
                      },
                      style2: true,
                    ),
                  ),
                ],
              ),
              10.height,
              AppText('نوع التركيب*'),
              CustomDropDown(
                hint: 'نوع التركيب',
                items: listInstallationType,
                itemAsString: (item) => item!,
                selectedItem: selectInstallationType,
                onChanged: (value) {
                  selectInstallationType = value;
                },
                validator: InputValidator.requiredFiled,
              ),
              10.height,
              AppText('اسناد الي*'),
              5.height,
              TechSupportUsersDropDown(
                fkUser: widget.event.fkUser,
                onSelectUser: (user) {
                  datesTableCubit.changedIdUser = user.idUser;
                },
              ),
              10.height,
              AppText('تحديد الأسباب*'),
              5.height,
              AppTextField(
                hintText: "تحديد الأسباب",
                controller: descresaonController,
                isRequired: true,
                maxLines: 3,
              ),
              10.height,
              Row(
                children: [
                  StatefulBuilder(
                    builder: (context, refresh) {
                      return Checkbox(
                        value: _isSmsChecked,
                        onChanged: (bool? value) {
                          _isSmsChecked = value ?? false;
                          refresh(() {});
                        },
                      );
                    },
                  ),
                  AppText('ارسال رسالة نصية للعميل'),
                ],
              ),
              10.height,
              Center(
                child: BlocConsumer<DatesTableCubit, DatesTableState>(
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
                            sms: _isSmsChecked ? '1' : null,
                          ),
                          onSuccess: (value) {
                            AppNavigator.pop(result: editedEvent);
                            AppSnackbar.showSnakeBar(
                              'تمت العملية بنجاح',
                              color: ToastColorsEnum.success,
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
                          AppSnackbar.showSnakeBar(
                            'من فضلك اختر نوع التركيب',
                            color: ToastColorsEnum.warning,
                          );
                          return;
                        }
                        if (endTime==null || (selectedStartTime.hour == endTime!.hour && selectedStartTime.minute ==endTime!.minute)) {
                          AppSnackbar.showSnakeBar('لا يمكن أن يكون وقت النهاية قبل وقت البداية');
                          return;
                        }
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
                          endTime==null?selectedStartTime.hour+1:endTime!.hour,
                          endTime==null?selectedStartTime.minute:endTime!.minute,
                        );
                        if (dateTask!.isAfter(dateEnd!)) {
                          AppSnackbar.showSnakeBar('لا يمكن أن يكون وقت النهاية قبل وقت البداية');
                          return;
                        }
                        if (_globalKey.currentState!.validate()) {
                          // Navigator.of(context, rootNavigator: true).pop(false);
                          _globalKey.currentState!.save();

                          print("current date is => $_currentDate");
                          print("selectedStartTime is => $selectedStartTime");
                          print("endTime is => $endTime");

                          Provider.of<InvoiceVm>(context, listen: false)
                              .setisload();


                          String? assignedTo = datesTableCubit.changedIdUser;
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
                              typeProcess: TypeProcessDate.reschedule.value,
                              sms: _isSmsChecked ? '1' : null,
                            ),
                            onSuccess: (value) {
                              AppSnackbar.showSnakeBar(
                                'تمت العملية بنجاح',
                                color: ToastColorsEnum.success,
                              );
                              AppNavigator.pop(result: editedEvent);
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  bool _selectedInstallationType() {
    return selectInstallationType == null || selectInstallationType!.isEmpty;
  }
}
