import 'dart:ui' as myui;

import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../ui/widgets/custom_widget/app_card_row.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../manager/dates_table_cubit.dart';
import 'custom_event_client_invoices_drop_down.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({
    super.key,
    this.subscribedClients,
    this.selectedDay,
  });

  final List<UserEntity>? subscribedClients;
  final DateTime? selectedDay;

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  late final DatesTableCubit _datesTableCubit;
  bool _isSmsChecked = false; // Add this line

  @override
  void initState() {
    _datesTableCubit = context.read<DatesTableCubit>();
    _datesTableCubit.addEventFormVariables.clear();
    _prepareSelectedDate();
    super.initState();
  }

  void _prepareSelectedDate() {
    if (widget.selectedDay != null) {
      _datesTableCubit.addEventFormVariables.selectedDateController.text =
          HelperFunctions.formatDate(widget.selectedDay!);
    }
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
            await _addDateInstall(force: 1);
          },
        );
      },
      child: AppDialog(title: 'إضافة موعد جديد', children: [
        StatefulBuilder(
          builder: (context, refresh) {
            return Directionality(
              textDirection: myui.TextDirection.rtl,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Form(
                  key: _datesTableCubit.addEventFormVariables.globalKey,
                  child: Column(
                    children: [
                      CustomDateTimePicker(
                        hintText: 'تعيين التاريخ',
                        dateTimeType: DateTimeEnum.date,
                        dateTimeController: _datesTableCubit
                            .addEventFormVariables.selectedDateController,
                        style2: true,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'بداية الزيارة',
                              dateTimeType: DateTimeEnum.time,
                              dateTimeController: _datesTableCubit
                                  .addEventFormVariables.startTimeController,
                              style2: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'نهاية الزيارة',
                              dateTimeType: DateTimeEnum.time,
                              dateTimeController: _datesTableCubit
                                  .addEventFormVariables.endTimeController,
                              style2: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      AppCardRow(title: "نوع التركيب", value: '*'),
                      SizedBox(height: 10),
                      CustomDropDown<InstallationTypeEnum>(
                        hint: "نوع التركيب",
                        items: InstallationTypeEnum.values,
                        itemAsString: (item) => item!.value,
                        selectedItem: _datesTableCubit
                            .addEventFormVariables.selectInstallationType.value,
                        onChanged: (value) {
                          _datesTableCubit.addEventFormVariables
                              .selectInstallationType.value = value!;
                          setState(() {});
                        },
                        validator: (value) {
                          return InputValidator.requiredFiled(value);
                        },
                        height: 70.h,
                      ),
                      SizedBox(height: 10),
                      if (widget.subscribedClients != null) ...[
                        AppCardRow(title: "العميل", value: '*'),
                        SizedBox(height: 10),
                        CustomSearchableDropDown<UserEntity>(
                          hint: 'العميل',
                          items: widget.subscribedClients!,
                          itemAsString: (item) => item!.name,
                          selectedItem: _datesTableCubit
                              .addEventFormVariables.selectedClient.value,
                          onChanged: (value) async {
                            _datesTableCubit.addEventFormVariables
                                .selectedClient.value = value;
                            setState(() {});
                            await _datesTableCubit.getInvoicesByClientForDate(
                              GetInvoicesByClientForDateParams(
                                  idClient: "${value!.id}"),
                            );
                          },
                          validator: (value) {
                            return InputValidator.requiredFiled(value);
                          },
                          filterFn: (item, filter) {
                            return item.name
                                .toLowerCase()
                                .contains(filter.toLowerCase());
                          },
                        ),
                      ],
                      ListenableBuilder(
                        listenable: Listenable.merge([
                          _datesTableCubit.addEventFormVariables.selectedClient,
                        ]),
                        builder: (context, child) {
                          if (!_isShowClientInvoices()) {
                            return SizedBox.shrink();
                          }
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              AppCardRow(title: "الفاتورة", value: '*'),
                              SizedBox(height: 10),
                              CustomEventClientInvoicesDropDown(),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      AppCardRow(title: "اسناد الي", value: '*'),
                      SizedBox(height: 10),
                      TechSupportUsersDropDown(
                        clear: true,
                        onSelectUser: (user) {
                          _datesTableCubit.addEventFormVariables
                              .selectedEmployee.value = user;
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Checkbox(
                            value: _isSmsChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isSmsChecked = value ?? false;
                              });
                            },
                          ),
                          AppText('ارسال رسالة نصية للعميل'),
                        ],
                      ),
                      // save button
                      BlocBuilder<DatesTableCubit, DatesTableState>(
                        builder: (context, state) {
                          return AppElevatedButton(
                            isLoading: state.addDateInstallStatus.isLoading(),
                            text: "حفظ",
                            onPressed: () async {
                              if (_datesTableCubit
                                  .addEventFormVariables.globalKey.currentState!
                                  .validate()) {
                                await _addDateInstall();
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
      ]),
    );
  }

  Future<void> _addDateInstall({int? force}) async {
    final params =
        _datesTableCubit.addEventFormVariables.getAddDateInstallParams(
      force: force,
      sms: _isSmsChecked ? '1' : null,
    );

    await _datesTableCubit.addDateInstall(
      params,
      onSuccess: (newEvent) {
        _datesTableCubit.handleEventsMap(updatedEvent: newEvent);
        AppSnackbar.showSnakeBar(
          'تمت الاضافة بنجاح',
          color: ToastColorsEnum.success,
        );
        AppNavigator.pop();
        setState(() {});
      },
    );
  }

  _isShowClientInvoices() {
    return _datesTableCubit.addEventFormVariables.selectedClient.value != null;
  }
}
