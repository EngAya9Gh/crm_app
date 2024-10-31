import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/helpers/compare_date_time.dart';
import '../../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
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
    required this.idClient,
    this.invoiceModel,
    required this.datesInstallation,
  });

  final String? invoiceId;
  final String idClient;
  final InvoiceModel? invoiceModel;
  final List<DateInstallationClient>? datesInstallation;

  @override
  State<AddDateDialog> createState() => _AddDateDialogState();
}

class _AddDateDialogState extends State<AddDateDialog> {
  late final SupportTabCubit _supportTabCubit;

  bool _isSmsChecked = false; // Add this line

  @override
  void initState() {
    super.initState();
    _supportTabCubit = context.read<SupportTabCubit>();
    _supportTabCubit.addDateFormVariablesEntity.clear();
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
            handleAddDateStates(
              context: context,
              state: state.addDateInstallStatus,
              onPressed: () async {
                AppNavigator.pop();
                await _addDateInstall(force: 1);
              },
            );
          },
          onSuccess: () {
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
                return Directionality(
                  textDirection: myui.TextDirection.rtl,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                    ),
                    child: Form(
                      key: _supportTabCubit.addDateFormVariablesEntity.globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDateTimePicker(
                            hintText: 'تعيين التاريخ',
                            dateTimeType: DateTimeEnum.date,
                            dateTimeController: _supportTabCubit.addDateFormVariablesEntity.selectedDateController,
                            style2: true,
                          ),
                          10.height,
                          Row(
                            children: [
                              Flexible(
                                child: CustomDateTimePicker(
                                  hintText: 'بداية الزيارة',
                                  dateTimeType: DateTimeEnum.time,
                                  dateTimeController: _supportTabCubit
                                      .addDateFormVariablesEntity.startTimeController,
                                  style2: true,
                                ),
                              ),
                              10.width,
                              Flexible(
                                child: CustomDateTimePicker(
                                  hintText: 'نهاية الزيارة',
                                  dateTimeType: DateTimeEnum.time,
                                  dateTimeController: _supportTabCubit
                                      .addDateFormVariablesEntity.endTimeController,
                                  style2: true,
                                ),
                              ),
                            ],
                          ),
                          10.height,
                          AppText('نوع التركيب*'),
                          5.height,
                          CustomDropDown<InstallationTypeEnum>(
                            hint: "نوع التركيب",
                            items: InstallationTypeEnum.values,
                            itemAsString: (item) => item!.value,
                            selectedItem: _supportTabCubit
                                .addDateFormVariablesEntity.selectInstallationType.value,
                            onChanged: (value) {
                              _supportTabCubit.addDateFormVariablesEntity
                                  .selectInstallationType.value = value!;
                            },
                            validator: (value) {
                              return InputValidator.requiredFiled(value);
                            },
                            height: 70.h,
                          ),
                          10.height,
                          AppText('اسناد الي*'),
                          5.height,
                          TechSupportUsersDropDown(
                            clear: true,
                            onSelectUser: (user) {
                              _supportTabCubit.addDateFormVariablesEntity
                                  .selectedEmployee.value = user;
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
                                      if (_supportTabCubit
                                          .addDateFormVariablesEntity.globalKey.currentState!
                                          .validate()) {
                                        await _addDateInstall();
                                      }
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
    int? force,
  }) async {
    final params =
    _supportTabCubit.addDateFormVariablesEntity.getAddDateInstallParams(
      force: force,
      sms: _isSmsChecked ? '1' : null,
      fkClient: widget.idClient,
      invoiceId:  widget.invoiceId ?? widget.invoiceModel?.idInvoice,
    );

    final isAfter = IsStartAfterEnd(_supportTabCubit.addDateFormVariablesEntity.startTimeController.text,_supportTabCubit.addDateFormVariablesEntity.endTimeController.text);

    if (isAfter) {
      AppSnackbar.showSnakeBar('لا يمكن أن يكون وقت النهاية قبل وقت البداية');
      return;
    }
    await _supportTabCubit.addDateInstall(
      params,
      onSuccess: (newEvent) {
        AppSnackbar.showSnakeBar(
          'تمت الاضافة بنجاح',
          color: ToastColorsEnum.success,
        );
        _supportTabCubit.addDateFormVariablesEntity.clear();
        AppNavigator.pop();
      },
    );
  }

  void _completeAddDate() {
    final event = EventModel(
      fkIdClient: widget.idClient,
      idinvoice: widget.invoiceModel?.idInvoice!,
      title: widget.invoiceModel?.name_enterprise ?? '',
      description: "description",
      from: _supportTabCubit.addDateFormVariablesEntity.prepareDateFromTime(_supportTabCubit.addDateFormVariablesEntity.startTimeController.text),
      to: _supportTabCubit.addDateFormVariablesEntity.prepareDateFromTime(_supportTabCubit.addDateFormVariablesEntity.endTimeController.text),
      typeDate: _supportTabCubit.addDateFormVariablesEntity.selectInstallationType.value.value,);
    Provider.of<EventProvider>(context, listen: false).addEvent(event);
    widget.datesInstallation?.add(DateInstallationClient(
      dateClientVisit: _supportTabCubit.addDateFormVariablesEntity.prepareDateFromTime(_supportTabCubit.addDateFormVariablesEntity.startTimeController.text),
      fkUser: _supportTabCubit.addDateFormVariablesEntity.selectedEmployee.value!.idUser,
      fkClient: widget.idClient,
      isDone: '0',
      fkInvoice: widget.invoiceId ?? widget.invoiceModel?.idInvoice,
    ));
  }

// Future<Null> _selectStartTime(BuildContext context, TimeOfDay? picked) async {
//   if (picked == null) return;
//
//   if (selectedEndTime != null) {
//     final startTime = DateTime(
//       _currentDate.year,
//       _currentDate.month,
//       _currentDate.day,
//       picked.hour,
//       picked.minute,
//     );
//
//     // _date
//     final endTime = DateTime(
//       _currentDate.year,
//       _currentDate.month,
//       _currentDate.day,
//       selectedEndTime!.hour,
//       selectedEndTime!.minute,
//     );
//
//     if (startTime.isAfter(endTime)) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('يجب أن يكون وقت البداية قبل وقت النهاية'),
//       ));
//       return;
//     }
//   }
//
//   setState(() {
//     selectedTime = picked;
//     final _hour = selectedTime.hour.toString();
//     final _minute = selectedTime.minute.toString();
//     final _time = _hour + ' : ' + _minute;
//     _timeController.text = _time;
//     _timeController.text = selectedTime.toString();
//   });
//   setdatetimevalue(_currentDate, selectedTime);
// }
//
// Future<Null> _selectEndTime(BuildContext context, TimeOfDay? picked) async {
//   if (picked == null) return;
//
//   if (selectedStartTime != null) {
//     final endDate = DateTime(
//       _currentDate.year,
//       _currentDate.month,
//       _currentDate.day,
//       picked.hour,
//       picked.minute,
//     );
//
//     final startTime = DateTime(
//       _currentDate.year,
//       _currentDate.month,
//       _currentDate.day,
//       selectedStartTime!.hour,
//       selectedStartTime!.minute,
//     );
//
//     if (startTime.isAfter(endDate)) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('يجب أن يكون وقت البداية قبل وقت النهاية'),
//       ));
//       return;
//     }
//   }
//
//   setState(() {
//     endTime = picked;
//     final _hour = endTime.hour.toString();
//     final _minute = endTime.minute.toString();
//     final _time = _hour + ' : ' + _minute;
//     _endtimeController.text = _time;
//     _endtimeController.text = endTime.toString();
//     selectedEndTime = endTime;
//   });
// }
//
// void setdatetimevalue(DateTime val, TimeOfDay? timeday) {
//   valuedateTime = val;
//   selectedStartTime = timeday;
// }


}