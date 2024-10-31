import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/compare_date_time.dart';
import '../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
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
  late final DatesTableCubit _datesTableCubit;
  EventModel? editedEvent;
  bool _isSmsChecked = false; // Add this line

  void initState() {
    super.initState();
    _datesTableCubit = context.read<DatesTableCubit>();
    _datesTableCubit.addEventFormVariables.clear();
    _datesTableCubit.changedIdUser = widget.event.fkUser;
    _datesTableCubit
        .addEventFormVariables.selectInstallationType.value=InstallationTypeEnum.fromString(widget.event.typeDate);
    _datesTableCubit.addEventFormVariables
        .selectedEmployee.value = UserModel(idUser: widget.event.fkUser,nameUser: widget.event.nameUser);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatesTableCubit, DatesTableState>(
      listener: (context, state) {
        handleAddDateStates(
          context: context,
          state: state.addDateInstallStatus,
          onPressed: () async {
            AppNavigator.pop();
            await _rescheduleDateInstall();
          },
        );
      },
      child: AppDialog(title: 'إعادة جدولة', children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Form(
            key: _datesTableCubit.addEventFormVariables.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDateTimePicker(
                  dateTimeType: DateTimeEnum.date,
                  dateTimeController: _datesTableCubit
                      .addEventFormVariables.selectedDateController,
                  style2: true,
                ),
                10.height,
                Row(
                  children: [
                    Flexible(
                      child: CustomDateTimePicker(
                        dateTimeType: DateTimeEnum.time,
                        hintText: 'وقت البداية',
                        dateTimeController: _datesTableCubit
                            .addEventFormVariables.startTimeController,
                        style2: true,
                      ),
                    ),
                    10.width,
                    Flexible(
                      child: CustomDateTimePicker(
                        dateTimeType: DateTimeEnum.time,
                        hintText: 'وقت النهاية',
                        dateTimeController: _datesTableCubit
                            .addEventFormVariables.endTimeController,
                        style2: true,
                      ),
                    ),
                  ],
                ),
                10.height,
                AppText('نوع التركيب*'),
                CustomDropDown<InstallationTypeEnum>(
                  hint: "نوع التركيب",
                  items: InstallationTypeEnum.values,
                  itemAsString: (item) => item!.value,
                  selectedItem: _datesTableCubit
                      .addEventFormVariables.selectInstallationType.value,
                  onChanged: (value) {
                    _datesTableCubit.addEventFormVariables
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
                  fkUser: widget.event.fkUser,
                  onSelectUser: (user) {
                    _datesTableCubit.addEventFormVariables
                        .selectedEmployee.value = user;
                    },
                ),
                10.height,
                AppText('تحديد الأسباب*'),
                5.height,
                AppTextField(
                  hintText: "تحديد الأسباب",
                  controller: _datesTableCubit.addEventFormVariables.descresaonController,
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
                          if (_datesTableCubit
                              .addEventFormVariables.globalKey.currentState!
                              .validate()) {
                            await _rescheduleDateInstall();
                            return;
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state.rescheduleDateStatus.isLoading(),
                        text: "حفظ",
                        onPressed: () async {
                          if (_datesTableCubit
                              .addEventFormVariables.globalKey.currentState!
                              .validate()) {

                            await _rescheduleDateInstall();
                            return;
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
      ]),
    );
  }

  Future<void> _rescheduleDateInstall() async {
    final params =
    _datesTableCubit.addEventFormVariables.getRescheduleDateParams(
      idClientsDate: widget.event.idClientsDate!,
      sms: _isSmsChecked ? '1' : null,
    );

    final isAfter = IsStartAfterEnd(_datesTableCubit.addEventFormVariables.startTimeController.text,_datesTableCubit.addEventFormVariables.endTimeController.text);

    if (isAfter) {
      AppSnackbar.showSnakeBar('لا يمكن أن يكون وقت النهاية قبل وقت البداية');
      return;
    }
    editedEvent = widget.event.copyWith(
      isDone: "3",
      from: _datesTableCubit.addEventFormVariables.prepareDateFromTime( _datesTableCubit.addEventFormVariables.startTimeController.text),
      to: _datesTableCubit.addEventFormVariables.prepareDateFromTime( _datesTableCubit.addEventFormVariables.endTimeController.text),
      typedate: _datesTableCubit.addEventFormVariables.selectInstallationType.value.value.toString(),
      fkUser: _datesTableCubit.addEventFormVariables.selectedEmployee.value!.id,
      nameUser:  _datesTableCubit.addEventFormVariables.selectedEmployee.value!.nameUser,
      comment: _datesTableCubit.addEventFormVariables.descresaonController.text,
    );
    await _datesTableCubit.rescheduleDate(
        params,
      onSuccess: (value) {
        AppSnackbar.showSnakeBar(
          'تمت العملية بنجاح',
          color: ToastColorsEnum.success,
        );
        _datesTableCubit.addEventFormVariables.clear();
        AppNavigator.pop(result: editedEvent);
      },
    );
  }

}
