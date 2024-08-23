import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../domain/use_cases/return_schedule_visit_to_open_usecase.dart';
import '../manager/dates_table_cubit.dart';

class ReopenEventDialog extends StatefulWidget {
  const ReopenEventDialog({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  State<ReopenEventDialog> createState() => _ReopenEventDialogState();
}

class _ReopenEventDialogState extends State<ReopenEventDialog> {
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
    return SimpleDialog(
      title: Text(
        "إعادة فتح الزيارة",
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
                  BlocConsumer<DatesTableCubit, DatesTableState>(
                    listener: (context, state) async {
                      if (state.reOpenEventStatus.isFailed()) {
                        AppSnackbar.showSnakeBar(
                          'حدث خطأ ما',
                          color: ToastColorsEnum.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state.reOpenEventStatus.isLoading(),
                        text: "تم",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await datesTableCubit.returnScheduleVisitToOpen(
                              ReturnScheduleVisitToOpenParams(
                                scheduleId: widget.event.idClientsDate!,
                                comment: _commentController.text,
                              ),
                              onSuccess: (value) {
                                AppSnackbar.showSnakeBar(
                                  'تم إعادة فتح الزيارة بنجاح',
                                  color: ToastColorsEnum.success,
                                );
                                AppNavigator.pop(
                                  result: widget.event.copyWith(
                                    isDone: value.isDone,
                                  ),
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
          ),
        ),
      ],
    );
  }
}
