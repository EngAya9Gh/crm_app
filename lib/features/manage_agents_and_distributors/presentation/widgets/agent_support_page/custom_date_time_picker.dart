import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/enums.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    Key? key,
    required this.dateTimeType,
    required this.dateTimeController,
    this.hintText,
    this.isStartFromNow = false,
    this.enabled = true,
    this.previousDateTimeController,
  }) : super(key: key);

  final DateTimeEnum dateTimeType;
  final TextEditingController dateTimeController;
  final TextEditingController? previousDateTimeController;
  final String? hintText;
  final bool? isStartFromNow;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        hintText: hintText != null ? hintText : 'تعيين ${dateTimeType.name}',
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      readOnly: true,
      onTap: () async {
        previousDateTimeController?.text = dateTimeController.text;
        await _dateOrTimePicker(context);
      },
      validator: (value) {
        if (dateTimeController.text.isEmpty) {
          return 'يرجى تعيين ${dateTimeType.name}';
        }
        return null;
      },
    );
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
              dateTimeController.text = DateFormat('yyyy-MM-dd').format(value);
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
