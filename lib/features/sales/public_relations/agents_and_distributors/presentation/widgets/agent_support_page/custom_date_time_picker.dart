import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/common/enums/enums.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    Key? key,
    required this.dateTimeType,
    required this.dateTimeController,
    this.hintText,
    this.isStartFromNow = false,
    this.enabled = true,
    this.previousDateTimeController,
    this.style2 = false,
  }) : super(key: key);

  final DateTimeEnum dateTimeType;
  final TextEditingController dateTimeController;
  final TextEditingController? previousDateTimeController;
  final String? hintText;
  final bool? isStartFromNow;
  final bool enabled;
  final bool style2;

  @override
  Widget build(BuildContext context) {
    return style2
        ? AppTextField(
            controller: dateTimeController,
            hintText:
                hintText != null ? hintText : 'تعيين ${dateTimeType.name}',
            prefixIcon: Icon(
              Icons.date_range,
              color: kMainColor,
            ),
            readOnly: true,
            onTap: () async => await _onTap(context),
            validator: _validator,
          )
        : TextFormField(
            enabled: enabled,
            controller: dateTimeController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.date_range,
                color: kMainColor,
              ),
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText:
                  hintText != null ? hintText : 'تعيين ${dateTimeType.name}',
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
            readOnly: true,
            onTap: () async => await _onTap(context),
            validator: _validator,
          );
  }

  Future<void> _onTap(BuildContext context) async {
    previousDateTimeController?.text = dateTimeController.text;
    await _dateOrTimePicker(context);
  }

  String? _validator(value) {
    if (dateTimeController.text.isEmpty) {
      return 'يرجى تعيين ${dateTimeType.name}';
    }
    return null;
  }

  Future<void> _dateOrTimePicker(BuildContext context) async {
    dateTimeType == DateTimeEnum.date
        ? await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: isStartFromNow == true ? DateTime.now() : DateTime(2018),
            lastDate: isStartFromNow == true ? DateTime(2100) : DateTime(2100),
          ).then((value) {
            if (value != null) {
              dateTimeController.text = HelperFunctions.formatDate(value);
            }
          })
        : await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then((value) {
            if (value != null) {
              dateTimeController.text = TimeOfDay(
                hour: value.hour,
                minute: value.minute,
              ).format(context);
            }
          });
  }
}
