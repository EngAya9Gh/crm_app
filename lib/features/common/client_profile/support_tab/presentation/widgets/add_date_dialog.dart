import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/event_provider.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../domain/use_cases/add_date_install_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
import 'tech_support_users_dropdown.dart';

class AddDateDialog extends StatefulWidget {
  const AddDateDialog({
    super.key,
    this.invoiceId,
    required this.list_installation_type,
    required this.idClient,
    this.invoiceModel,
    required this.datesInstallation,
  });

  final String? invoiceId;
  final List<String> list_installation_type;
  final String idClient;
  final InvoiceModel? invoiceModel;
  final List<DateInstallationClient>? datesInstallation;

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
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _endtimeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DateTime valuedateTime = DateTime(1, 1, 1);
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  DateTime? dateTask;
  DateTime? dateEnd;
  bool _isSmsChecked = false; // Add this line

  @override
  void initState() {
    supportTabCubit = context.read<SupportTabCubit>();
    selectInstallationType = widget.list_installation_type.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupportTabCubit, SupportTabState>(
      listener: (context, state) {
        handleAddDateStates(
          context: context,
          state: state.addDateInstallStatus,
          onPressed: () async {
            AppNavigator.pop();
            await _addDateInstall(dateEnd: dateEnd!, force: 1);
          },
          onSuccess: () {
            _completeAddDate(dateTask!);
            dateTask = null;
            dateEnd = null;
            AppNavigator.pop(result: true);
          },
        );
      },
      child: SimpleDialog(
          titlePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          contentPadding: EdgeInsets.all(15),
          title: Center(child: AppText('إضافة موعد جديد')),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomDateTimePicker(
                            hintText: 'تعيين التاريخ',
                            dateTimeType: DateTimeEnum.date,
                            dateTimeController: dateController,
                            onDateChange: (dateTime, formattedDate) {
                              _currentDate = dateTime;

                              _currentDate
                                  .add(Duration(hours: DateTime.now().hour));
                              setdatetimevalue(_currentDate, null);
                            },
                            style2: true,
                          ),
                          10.height,
                          Row(
                            children: [
                              Flexible(
                                child: CustomDateTimePicker(
                                  hintText: 'بداية الزيارة',
                                  dateTimeType: DateTimeEnum.time,
                                  dateTimeController: _timeController,
                                  onTimeChange: (dateTime, formattedDate) {
                                    selectedTime = dateTime;
                                    setdatetimevalue(
                                        _currentDate, selectedTime);
                                    _selectStartTime(context, dateTime);
                                  },
                                  style2: true,
                                ),
                              ),
                              10.width,
                              Flexible(
                                child: CustomDateTimePicker(
                                  hintText: 'نهاية الزيارة',
                                  dateTimeType: DateTimeEnum.time,
                                  dateTimeController: _endtimeController,
                                  onTimeChange: (dateTime, formattedDate) {
                                    _selectEndTime(context, dateTime);
                                  },
                                  style2: true,
                                ),
                              ),
                            ],
                          ),
                          10.height,
                          AppText('نوع التركيب*'),
                          5.height,
                          CustomDropDown(
                            hint: 'نوع التركيب',
                            items: widget.list_installation_type,
                            itemAsString: (item) => item!,
                            selectedItem: selectInstallationType,
                            onChanged: (value) {
                              selectInstallationType = value!;
                              setState(() {});
                            },
                          ),
                          10.height,
                          AppText('اسناد الي*'),
                          5.height,
                          TechSupportUsersDropDown(
                            clear: true,
                            onSelectUser: (user) {
                              supportTabCubit.changedIdUser = user.idUser;
                            },
                          ),
                          SizedBox(height: 15),
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
                          SizedBox(height: 15),
                          // save button
                          BlocBuilder<SupportTabCubit, SupportTabState>(
                            builder: (context, state) {
                              return Center(
                                child: AppElevatedButton(
                                  isLoading:
                                      state.addDateInstallStatus.isLoading(),
                                  text: "حفظ",
                                  onPressed: () async {
                                    try {
                                      if (!_globalKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      _globalKey.currentState!.save();
                                      final startDate = _currentDate;
                                      dateTask = DateTime(
                                        startDate.year,
                                        startDate.month,
                                        startDate.day,
                                        selectedTime.hour,
                                        selectedTime.minute,
                                      );
                                      dateEnd = DateTime(
                                          startDate.year,
                                          startDate.month,
                                          startDate.day,
                                          endTime.hour,
                                          endTime.minute);

                                      await _addDateInstall(dateEnd: dateEnd!);
                                    } catch (e) {
                                      AppSnackbar.showSnakeBar(
                                        "حدث خطأ ما",
                                        color: ToastColorsEnum.error,
                                      );
                                    }
                                  },
                                ),
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
          ]),
    );
  }

  Future<void> _addDateInstall({
    required DateTime dateEnd,
    int? force,
  }) async {
    await supportTabCubit.addDateInstall(
      AddDateInstallParams(
        idInvoice: widget.invoiceId ?? widget.invoiceModel?.idInvoice,
        fkUser: supportTabCubit.changedIdUser,
        dateClientVisit: dateTask.toString(),
        dateEnd: dateEnd.toString(),
        typeDate: selectInstallationType,
        force: force,
        sms: _isSmsChecked ? '1' : null,
      ),
    );
  }

  void _completeAddDate(DateTime dateTask) {
    final event = EventModel(
      fkIdClient: widget.idClient,
      idinvoice: widget.invoiceModel?.idInvoice!,
      title: widget.invoiceModel?.name_enterprise ?? '',
      description: "description",
      from: dateTask,
      to: dateTask.add(Duration(hours: 2)),
      typeDate: '',
    );

    if (context.mounted) {
      Provider.of<EventProvider>(context, listen: false).addEvent(event);
    }

    widget.datesInstallation?.add(DateInstallationClient(
      dateClientVisit: dateTask,
      fkUser: supportTabCubit.changedIdUser,
      fkClient: widget.idClient,
      isDone: '0',
      fkInvoice: widget.invoiceId ?? widget.invoiceModel?.idInvoice,
    ));

    setState(() {});

    _currentDate = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
  }

  Future<Null> _selectStartTime(BuildContext context, TimeOfDay? picked) async {
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

  Future<Null> _selectEndTime(BuildContext context, TimeOfDay? picked) async {
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

  void setdatetimevalue(DateTime val, TimeOfDay? timeday) {
    valuedateTime = val;
    selectedStartTime = timeday;
    setState(() {});
  }

  @override
  void dispose() {
    _timeController.dispose();
    dateController.dispose();
    _endtimeController.dispose();
    valuedateTime = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    selectedStartTime = null;
    selectedEndTime = null;
    selectInstallationType = widget.list_installation_type.first;
    super.dispose();
  }
}
