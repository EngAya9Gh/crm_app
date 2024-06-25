import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../manager/dates_table_cubit.dart';
import '../../../../../model/calendar/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneClientEventDialog extends StatefulWidget {
  const DoneClientEventDialog({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  State<DoneClientEventDialog> createState() => _DoneClientEventDialogState();
}

class _DoneClientEventDialogState extends State<DoneClientEventDialog> {
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
          "إغلاق الجدولة",
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
                          isLoading: state.changeDateToDoneStatus.isLoading(),
                          text: "حفظ",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await datesTableCubit.changeDateToDone(
                                ChangeDateToDoneParams(
                                  event: widget.event.copyWith(
                                    comment: _commentController.text,
                                  ),
                                ),
                                onSuccess: (value) {
                                  AppNavigator.pop(result: true);
                                  AppConstants.showSnakeBar(
                                      context, "تمت العملية بنجاح");

                                  datesTableCubit.handleEventsMap(
                                    updatedEvent: widget.event.copyWith(
                                      isDone: "1",
                                      comment: _commentController.text,
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
      ),
    );
  }
}
