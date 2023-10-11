import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_padding.dart';
import '../../../../core/utils/theme_state.dart';

typedef dynamic DropdownSearchItemAsValue<T>(T item);

class AppDropdownButtonFormField<T> extends StatefulWidget {
  const AppDropdownButtonFormField({
    this.itemAsValue,
    this.itemAsString,
    this.items = const [],
    required this.onChange,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hint,
    this.menuMaxHeight,
    this.icon,
    this.focusNode,
    Key? key,
    this.value,
    this.title,
    this.textStyle,
  }) : super(key: key);

  final List<T> items;
  final T? value;
  final DropdownSearchItemAsString<T>? itemAsString;
  final DropdownSearchItemAsValue<T>? itemAsValue;
  final ValueChanged onChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final VoidCallback? onTap;
  final String? hint;
  final double? menuMaxHeight;
  final Widget? icon;
  final FocusNode? focusNode;
  final String? title;
  final TextStyle? textStyle;

  @override
  State<AppDropdownButtonFormField> createState() => _AppDropdownButtonFormFieldState();
}

class _AppDropdownButtonFormFieldState<T> extends ThemeState<AppDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...{
          Text(
            widget.title!,
            style: context.textTheme.titleMedium.s15.sb,
          ),
          5.verticalSpace,
        },
        DropdownButtonFormField<T>(
          isExpanded: true,
          items: widget.items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: widget.itemAsValue?.call(item) ?? item,
                  child:  Text(
                    widget.itemAsString?.call(item) ?? item.toString(),
                    style: widget.textStyle ?? textTheme.titleSmall.r,
                  ),
                ),
              )
              .toList(),
          onChanged: widget.onChange,
          onTap: widget.onTap,
          onSaved: widget.onSaved,
          validator: widget.validator,
          menuMaxHeight: widget.menuMaxHeight,
          icon: widget.icon ?? const SizedBox.shrink(),
          focusNode: widget.focusNode,
          value: widget.value,
          dropdownColor: colorScheme.borderTextField,
          isDense: false,
          hint: widget.hint != null
              ?  Text(
                  widget.hint!,
                  style: textTheme.titleSmall?.copyWith(color: colorScheme.drawer.withOpacity(0.3)),
                )
              : null,
          borderRadius: BorderRadius.circular(8) ,
          style: textTheme.bodyMedium ,
          decoration: InputDecoration(
            filled: false,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primary),
              borderRadius: BorderRadius.circular(kbrBorderTextField),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primary),
              borderRadius: BorderRadius.circular(kbrBorderTextField),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primary),
              borderRadius: BorderRadius.circular(kbrBorderTextField),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primary),
              borderRadius: BorderRadius.circular(kbrBorderTextField),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.error),
              borderRadius: BorderRadius.circular(kbrBorderTextField),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.error),
              borderRadius: BorderRadius.circular(kbrBorderTextField),
            ),
            // contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
            suffixIcon: Icon(Icons.arrow_drop_down_rounded,
                color: widget.items.isEmpty ? colorScheme.primary.withOpacity(0.3) : colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
