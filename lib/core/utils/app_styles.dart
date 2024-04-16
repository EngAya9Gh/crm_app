import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';

import 'responsive_padding.dart';

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
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
      contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.primary),
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
