import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/type_process_date.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/calendar/event_model.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  late final DatesTableCubit datesTableCubit;

  @override
  void initState() {
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SimpleDialog(
        title: Text(
          "إلغاء الزيارة",
          textAlign: TextAlign.center,
        ),
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
                        if (value!.trim().isEmpty) {
                          return "التعليق مطلوب";
                        }
                        return null;
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
      ),
    );
  }

  Future<void> _onTapOk(BuildContext context) async {
    await datesTableCubit.cancelSchedule(
      CancelScheduleParams(
        scheduleId: widget.event.idClientsDate!,
        typeProcess: TypeProcessDate.cancel.value,
        processReason: _commentController.text,
      ),
      onSuccess: (value) {
        AppNavigator.pop(
          result: widget.event.copyWith(isDone: IsDoneDateEnum.canceled.value),
        );
        AppConstants.showSnakeBar(
          context,
          'تم إلغاء الزيارة',
        );
      },
      onFail: (value) {
        AppConstants.showSnakeBar(
          context,
          'حدث خطأ ما',
        );
      },
    );
  }
}
