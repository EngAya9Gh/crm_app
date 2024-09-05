import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/utils/app_colors.dart';

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
      width: 50.scaleIconsSize,
      height: 50.scaleIconsSize,
      textStyle: AppStyles.textStyle.copyWith(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.grey.shade100.withOpacity(0.7),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(15),
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
