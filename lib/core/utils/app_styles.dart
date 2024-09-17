import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../common/extensions/build_context.dart';

abstract class AppStyles {
  static const Decoration customBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      const Radius.circular(13.0),
    ), // BorderRadius
  );

  static InputDecoration roundedDropdownButtonDecoration({
    required BuildContext context,
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(
        horizontal: (15.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.error),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.error),
        borderRadius: BorderRadius.circular(12),
      ),
      suffixIconColor: AppColors.primaryColor,
    );
  }

  static InputDecoration underlinedDropdownButtonDecoration({
    required BuildContext context,
    required String hintText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: context.textTheme.titleSmall?.copyWith(
        color: Colors.grey,
      ),
      contentPadding: EdgeInsets.zero,
      fillColor: Colors.grey.withOpacity(0.2),
      hintTextDirection: TextDirection.rtl,
      border: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }

  static TextStyle get textStyle => TextStyle(
        color: Colors.black,
        fontSize: 20.scaleFontSize,
        fontFamily: AppFonts.fontFamily2,
      );
}
