import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/enums.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    Key? key,
    required this.dateTimeType,
    required this.dateTimeController,
  }) : super(key: key);

  final DateTimeEnum dateTimeType;
  final TextEditingController dateTimeController;

  @override
  Widget build(BuildContext context) {
    final String text = _dateTimeType();
    return Flexible(
      child: TextFormField(
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
          hintText: 'تعيين $text',
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        readOnly: true,
        onTap: () async {
          // both date and time picker
          await _dateOrTimePicker(context);
        },
        validator: (value) {
          if (dateTimeController.text.isEmpty) {
            return 'يرجى تعيين $text';
          }
          return null;
        },
      ),
    );
  }

  String _dateTimeType() {
    if (dateTimeType == DateTimeEnum.date) {
      return 'التاريخ';
    } else {
      return 'الوقت';
    }
  }

  Future<void> _dateOrTimePicker(BuildContext context) async {
    dateTimeType == DateTimeEnum.date
        ? await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime(2100),
          ).then((value) {
            if (value != null) {
              dateTimeController.text = DateFormat('yyyy-MM-dd').format(value);
            }
          })
        : await showTimePicker(
            // booth date and time
            context: context,
            initialTime: TimeOfDay.now(),
          ).then((value) {
            if (value != null) {
              dateTimeController.text = DateFormat('HH:mm:ss').format(
                DateTime(2021, 1, 1, value.hour, value.minute),
              );
            }
          });
  }
}
