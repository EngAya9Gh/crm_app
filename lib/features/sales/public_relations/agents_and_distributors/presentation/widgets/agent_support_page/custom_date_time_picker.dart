import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_styles.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({
    super.key,
    required this.dateTimeType,
    required this.dateTimeController,
    this.hintText,
    this.floatingLabelText,
    this.isStartFromNow = false,
    this.enabled = true,
    this.previousDateTimeController,
    this.style2 = false,
    this.helperText,
    this.onDateChange,
    this.onTimeChange,
    this.formatDate,
    this.isRequired = true,
  });

  final DateTimeEnum dateTimeType;
  final TextEditingController dateTimeController;
  final TextEditingController? previousDateTimeController;
  final String? hintText;
  final String? floatingLabelText;
  final bool? isStartFromNow;
  final bool enabled;
  final bool style2;
  final String? helperText;
  final Function(DateTime, String)? onDateChange;
  final Function(TimeOfDay, String)? onTimeChange;
  final bool isRequired;
  final DateFormat? formatDate;

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  bool _mounted = true;

  @override
  void initState() {
    widget.dateTimeController.addListener(_onControllerChange);
    super.initState();
  }

  @override
  void dispose() {
    _mounted = false;
    widget.dateTimeController.removeListener(_onControllerChange);
    super.dispose();
  }

  void _onControllerChange() {
    if (!_mounted) return;

    if (widget.dateTimeType == DateTimeEnum.date && widget.dateTimeController.text.isNotEmpty) {
      widget.onDateChange?.call(
        HelperFunctions.dateFromString(widget.dateTimeController.text)!,
        widget.dateTimeController.text,
      );
    } else if (widget.dateTimeType == DateTimeEnum.time && widget.dateTimeController.text.isNotEmpty) {
      if (HelperFunctions.timeFromString(widget.dateTimeController.text) != null)
        widget.onTimeChange?.call(
          HelperFunctions.timeFromString(widget.dateTimeController.text)!,
          widget.dateTimeController.text,
        );
    } else if (widget.dateTimeType == DateTimeEnum.both && widget.dateTimeController.text.isNotEmpty) {
      if ((widget.dateTimeController.text.isNotEmpty) &&widget.formatDate!=null)
        widget.onDateChange?.call(
          widget.formatDate!.parse(widget.dateTimeController.text),
          widget.dateTimeController.text,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    _handleDateTime(context);
    return widget.style2
        ? AppTextField(
            controller: widget.dateTimeController,
            textStyle: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
            ),
            hintText: widget.hintText != null ? widget.hintText : 'تعيين ${widget.dateTimeType.name}',
            hintTextStyle: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
              color: Colors.grey,
            ),
            labelText: widget.floatingLabelText,
            prefixIcon: Icon(
              Icons.date_range,
              color: AppColors.primaryMain,
              size: (25.0).scaleFontSize,
            ),
            readOnly: true,
            enabled: widget.enabled,
            onTap: () async => await _onTap(context),
            // onChange: (val) {
            //   print("on change");
            //   if (widget.dateTimeType == DateTimeEnum.date) {
            //     widget.onDateChange?.call(
            //       HelperFunctions.dateFromString(
            //           widget.dateTimeController.text)!,
            //       widget.dateTimeController.text,
            //     );
            //   } else {
            //     widget.onTimeChange?.call(
            //       HelperFunctions.timeFromString(
            //           widget.dateTimeController.text)!,
            //       widget.dateTimeController.text,
            //     );
            //   }
            // },
            validator: _validator,
            helperText: widget.helperText,
          )
        : TextFormField(
            enabled: widget.enabled,
            controller: widget.dateTimeController,
            style: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.date_range,
                color: AppColors.primaryMain,
              ),
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText: widget.hintText != null ? widget.hintText : 'تعيين ${widget.dateTimeType.name}',
              labelText: widget.floatingLabelText,
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
            readOnly: true,
            onTap: () async => await _onTap(context),
            validator: _validator,
          );
  }

  void _handleDateTime(BuildContext context) {
    if (widget.dateTimeController.text.isEmpty) return;
    if (widget.dateTimeType == DateTimeEnum.date) {
      final dateTime = HelperFunctions.dateFromString(widget.dateTimeController.text);
      if (dateTime == null) return;
      widget.dateTimeController.text = HelperFunctions.formatDate(dateTime);
    } else {
      final dateTime = HelperFunctions.timeFromString(widget.dateTimeController.text);
      if (dateTime == null) return;
      widget.dateTimeController.text = HelperFunctions.formatTime(
        context,
        dateTime,
      );
    }
  }

  Future<void> _onTap(BuildContext context) async {
    widget.previousDateTimeController?.text = widget.dateTimeController.text;
    await _dateTimePicker(context);
  }

  String? _validator(value) {
    if (widget.isRequired && value.isEmpty) {
      return 'يرجى تعيين ${widget.dateTimeType.name}';
    }
    return null;
  }

  Future<void> _dateTimePicker(BuildContext context) async {
    if (widget.dateTimeType == DateTimeEnum.date) {
      await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: widget.isStartFromNow == true ? DateTime.now() : DateTime(2018),
          lastDate: widget.isStartFromNow == true ? DateTime(2100) : DateTime(2100),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryMain,
                  onPrimary: Colors.white,
                ),
              ),
              child: child!,
            );
          }).then((value) {
        if (value != null && _mounted) {
          setState(() {
            widget.dateTimeController.text = HelperFunctions.formatDate(value);
          });
        }
      });
    } else if (widget.dateTimeType == DateTimeEnum.time) {
      await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryMain,
                  onPrimary: Colors.white,
                ),
              ),
              child: child!,
            );
          }).then((value) {
        if (value != null && _mounted) {
          setState(() {
            widget.dateTimeController.text = HelperFunctions.formatTime(
              context,
              value,
            );
          });
        }
      });
    } else {
      final DateTime? selectedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: widget.isStartFromNow == true ? DateTime.now() : DateTime(2018),
        lastDate: widget.isStartFromNow == true ? DateTime(2100) : DateTime(2100),
      );

      if (selectedDateTime == null) return;

      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime == null) return;
      if (_mounted) {
        if (widget.formatDate != null) {
          setState(() {
            widget.dateTimeController.text = widget.formatDate!.format(selectedDateTime.copyWith(
              hour: selectedTime.hour,
              minute: selectedTime.minute,
            ));
          });
          return;
        }
        setState(() {
          widget.dateTimeController.text = HelperFunctions.formatDate(selectedDateTime) + ' ' + HelperFunctions.formatTime(context, selectedTime);
        });
      }
    }
    }
}
