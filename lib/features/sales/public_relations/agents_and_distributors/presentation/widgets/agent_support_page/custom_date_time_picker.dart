import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../app/presentation/widgets/app_text_field.dart.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    Key? key,
    required this.dateTimeType,
    required this.dateTimeController,
    this.hintText,
    this.floatingLabelText,
    this.isStartFromNow = false,
    this.enabled = true,
    this.previousDateTimeController,
    this.style2 = false,
    this.helperText,
  }) : super(key: key);

  final DateTimeEnum dateTimeType;
  final TextEditingController dateTimeController;
  final TextEditingController? previousDateTimeController;
  final String? hintText;
  final String? floatingLabelText;
  final bool? isStartFromNow;
  final bool enabled;
  final bool style2;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    _handleDateTime(context);
    return style2
        ? AppTextField(
            controller: dateTimeController,
            textStyle: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
            ),
            hintText:
                hintText != null ? hintText : 'تعيين ${dateTimeType.name}',
            hintTextStyle: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
              color: Colors.grey,
            ),
            labelText: floatingLabelText,
            prefixIcon: Icon(
              Icons.date_range,
              color: AppColors.primaryColor,
              size: (25.0).scaleFontSize,
            ),
            readOnly: true,
            onTap: () async => await _onTap(context),
            validator: _validator,
            helperText: helperText,
          )
        : TextFormField(
            enabled: enabled,
            controller: dateTimeController,
            style: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.date_range,
                color: AppColors.primaryColor,
              ),
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText:
                  hintText != null ? hintText : 'تعيين ${dateTimeType.name}',
              labelText: floatingLabelText,
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
            readOnly: true,
            onTap: () async => await _onTap(context),
            validator: _validator,
          );
  }

  void _handleDateTime(BuildContext context) {
    if (dateTimeController.text.isEmpty) return;
    if (dateTimeType == DateTimeEnum.date) {
      final dateTime = HelperFunctions.dateFromString(dateTimeController.text);
      if (dateTime == null) return;
      dateTimeController.text = HelperFunctions.formatDate(dateTime);
    } else {
      final dateTime = HelperFunctions.timeFromString(dateTimeController.text);
      if (dateTime == null) return;
      dateTimeController.text = HelperFunctions.formatTime(
        context,
        dateTime,
      );
    }
  }

  Future<void> _onTap(BuildContext context) async {
    previousDateTimeController?.text = dateTimeController.text;
    await _dateTimePicker(context);
  }

  String? _validator(value) {
    if (dateTimeController.text.isEmpty) {
      return 'يرجى تعيين ${dateTimeType.name}';
    }
    return null;
  }

  Future<void> _dateTimePicker(BuildContext context) async {
    if (dateTimeType == DateTimeEnum.date) {
      await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: isStartFromNow == true ? DateTime.now() : DateTime(2018),
          lastDate: isStartFromNow == true ? DateTime(2100) : DateTime(2100),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryColor,
                  onPrimary: Colors.white,
                ),
              ),
              child: child!,
            );
          }).then((value) {
        if (value != null) {
          dateTimeController.text = HelperFunctions.formatDate(value);
        }
      });
    } else if (dateTimeType == DateTimeEnum.time) {
      await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryColor,
                  onPrimary: Colors.white,
                ),
              ),
              child: child!,
            );
          }).then((value) {
        if (value != null) {
          dateTimeController.text = HelperFunctions.formatTime(
            context,
            value,
          );
        }
      });
    } else {
      final DateTime? selectedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: isStartFromNow == true ? DateTime.now() : DateTime(2018),
        lastDate: isStartFromNow == true ? DateTime(2100) : DateTime(2100),
      );

      if (selectedDateTime == null) return;

      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime == null) return;

      dateTimeController.text = HelperFunctions.formatDate(selectedDateTime) +
          ' ' +
          HelperFunctions.formatTime(context, selectedTime);
    }
  }
}
