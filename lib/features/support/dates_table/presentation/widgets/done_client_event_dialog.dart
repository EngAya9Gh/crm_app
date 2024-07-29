import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../manager/dates_table_cubit.dart';

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
  late InstallationTypeEnum _installationType;
  late final DatesTableCubit datesTableCubit;

  @override
  void initState() {
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    _installationType = InstallationTypeEnum.fromString(widget.event.typeDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
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
                  CustomDropDown(
                    hint: "نوع التركيب",
                    items: InstallationTypeEnum.values,
                    itemAsString: (item) => item!.value,
                    selectedItem: _installationType,
                    onChanged: (value) => _installationType = value!,
                    height: 70.h,
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
                        isLoading: state.changeDateToDoneStatus.isLoading(),
                        text: "حفظ",
                        onPressed: () async {
                          final editedEvent = widget.event.copyWith(
                            isDone: "1",
                            typedate: _installationType.value,
                            comment: _commentController.text,
                          );
                          if (_formKey.currentState!.validate()) {
                            await datesTableCubit.changeDateToDone(
                              ChangeDateToDoneParams(
                                event: editedEvent,
                              ),
                              onSuccess: (value) {
                                datesTableCubit.handleEventsMap(
                                  updatedEvent: editedEvent,
                                );
                                AppNavigator.pop(result: true);
                                AppConstants.showSnakeBar("تمت العملية بنجاح");
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
