import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../common/extensions/build_context.dart';

abstract class AppStyles {
  // fonts

  static TextStyle get textStyle {
    return TextStyle(
      color: Colors.black,
      fontSize: 20.scaleFontSize,
      fontFamily: AppFonts.fontFamily1,
    );
  }

  static TextStyle large = textStyle.copyWith(
    fontSize: 48.scaleFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle regular20 = textStyle.copyWith(
    fontSize: 20.scaleFontSize,
  );

  static TextStyle regular18 = textStyle.copyWith(
    fontSize: 18.scaleFontSize,
  );

  TextStyle get text20px => const TextStyle(
        fontSize: 20,
        decoration: TextDecoration.none,
        fontFamily: 'Almarai-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 20 / 20,
        letterSpacing: 0,
      );

  TextStyle get stute => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontFamily: 'Inter-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 16,
        letterSpacing: 0,
      );

  TextStyle get largetitle48pxbold => const TextStyle(
        fontSize: 48,
        decoration: TextDecoration.none,
        fontFamily: 'Almarai-Bold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 76 / 48,
        letterSpacing: -1.5,
      );

  TextStyle get largetitlebage => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontFamily: 'Almarai-Bold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 24 / 24,
        letterSpacing: 0,
      );

  TextStyle get largetitlebody => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontFamily: 'Almarai-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 24,
        letterSpacing: 0,
      );

  TextStyle get largetitleregular18px => const TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
        fontFamily: 'Almarai-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 18 / 18,
        letterSpacing: 0,
      );

  //

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
        borderSide: BorderSide(color: AppColors.primaryMain),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryMain),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryMain),
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryMain),
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
      suffixIconColor: AppColors.primaryMain,
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
}
