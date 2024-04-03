import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/config/theme/theme.dart';

class VerificationNumberFields extends StatefulWidget {
  const VerificationNumberFields({
    Key? key,
    required this.onCompleted,
    this.validator,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  @override
  State<VerificationNumberFields> createState() =>
      _VerificationNumberFieldsState();
}

class _VerificationNumberFieldsState extends State<VerificationNumberFields> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 65.r,
      height: 65.r,
      textStyle: context.textTheme.headlineSmall?.r?.copyWith(
        color: context.colorScheme.onBackground,
        decoration: TextDecoration.none,
        decorationColor: AppColors.grey.shade100.withOpacity(0.3),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.grey.shade100.withOpacity(0.3),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(15.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(),
    );

    return Pinput(
      controller: widget.controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: widget.validator,
      showCursor: true,
      pinAnimationType: PinAnimationType.slide,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      length: 5,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autofocus: true,
    );
  }
}
