import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/features/support/dates_table/presentation/widgets/cancel_date_reasons_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/enums/type_process_date.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/cancel_date_reason_model.dart';
import '../../domain/use_cases/cancel_schedule_usecase.dart';
import '../manager/dates_table_cubit.dart';

class CancelEventDialog extends StatefulWidget {
  const CancelEventDialog({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  State<CancelEventDialog> createState() => _CancelEventDialogState();
}

class _CancelEventDialogState extends State<CancelEventDialog> {
  late final DatesTableCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  late CancelDateReasonModel selectedReason;

  @override
  void initState() {
    _cubit = context.read<DatesTableCubit>();
    if (_cubit.state.getCancelReasonsStatus.data == null) {
      _cubit.getCancelReasons();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "إلغاء الزيارة",
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CancelDateReasonsDropdown(
                    onChanged: (value) {
                      selectedReason = value!;
                    },
                  ),
                  10.height,
                  TextFormField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "أكتب تعليقك هنا *",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      return InputValidator.requiredFiled(value);
                    },
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<DatesTableCubit, DatesTableState>(
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state.cancelScheduleStatus.isLoading(),
                        text: "تم",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _onTapOk(context);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onTapOk(BuildContext context) async {
    await _cubit.cancelSchedule(
      CancelScheduleParams(
        scheduleId: widget.event.idClientsDate!,
        typeProcess: TypeProcessDate.cancel.value,
        processReason: _commentController.text,
        selectedReason: selectedReason,
      ),
      onSuccess: (value) {
        AppNavigator.pop(
          result: widget.event.copyWith(isDone: IsDoneDateEnum.canceled.value),
        );
        AppSnackbar.showSnakeBar(
          'تم إلغاء الزيارة',
          color: ToastColorsEnum.success,
        );
      },
      onFail: (value) {
        AppSnackbar.showSnakeBar(
          'حدث خطأ ما',
          color: ToastColorsEnum.error,
        );
      },
    );
  }
}
