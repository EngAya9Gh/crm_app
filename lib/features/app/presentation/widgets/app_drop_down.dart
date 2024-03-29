import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_padding.dart';
import 'app_text.dart';

typedef V DropdownSearchItemAsValue<T, V>(T? item);
typedef Widget DropdownBuilder<T>(T? item);

class AppDropdownButtonFormField<T, V> extends StatelessWidget {
  const AppDropdownButtonFormField({
    required this.itemAsValue,
    this.itemAsString,
    this.items = const [],
    required this.onChange,
    this.onSaved,
    this.itemBuilder,
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
    this.fillColor,
    this.borderColor,
    this.iconColor,
    this.styleForHintText,
    this.isFilledColor,
    this.isWithImage=false
  }) : super(key: key);

  final List<T> items;
  final V? value;
  final DropdownSearchItemAsString<T?>? itemAsString;
  final DropdownBuilder<T>? itemBuilder;
  final DropdownSearchItemAsValue<T?, V?> itemAsValue;
  final ValueChanged<V?>? onChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator<V?>? validator;
  final VoidCallback? onTap;
  final String? hint;
  final double? menuMaxHeight;
  final Widget? icon;
  final FocusNode? focusNode;
  final String? title;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? iconColor;
  final TextStyle? styleForHintText;
  final bool? isFilledColor;
  final bool? isWithImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...{
          AppText(
            title!,
            style: context.textTheme.titleMedium,
          ),
          5.verticalSpace,
        },
        DropdownButtonFormField<V>(
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem<V>(

              value: itemAsValue.call(item),
              alignment: Alignment.centerRight,


              child: itemAsString != null
                  ? isWithImage!?ListTile(
                contentPadding: EdgeInsets.zero,

                title: Text(itemAsString?.call(item) ?? item.toString(),  style: textStyle ?? context.textTheme.titleSmall,textDirection: TextDirection.rtl,),
                trailing: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage("https://smartcrm.ws/test/api/imagesApp/profile/48464df755303690b6627314ec202d64.png"),
                ),
              ):AppText(
                itemAsString?.call(item) ?? item.toString(),
                style: textStyle ?? context.textTheme.titleSmall,
              )
                  : itemBuilder!(item),
            ),
              )
              .toList(),
          onChanged: onChange,
          onTap: onTap,
          onSaved: onSaved,
          validator: validator,
          menuMaxHeight: menuMaxHeight,
          icon: const SizedBox.shrink(),
          selectedItemBuilder: (context){
            return  items.map(
                  (item) => DropdownMenuItem<V>(

                value: itemAsValue.call(item),
                alignment: Alignment.centerRight,


                child: itemAsString != null
                    ? AppText(
                  itemAsString?.call(item) ?? item.toString(),
                  style: textStyle ?? context.textTheme.titleSmall,
                )
                    : itemBuilder!(item),
              ),
            )
                .toList();
          },
          focusNode: focusNode,
          value: value,
          dropdownColor: context.colorScheme.surface,
          isDense: false,
          hint: hint != null
              ? AppText(
            hint!,
            style: styleForHintText??context.textTheme.titleSmall?.copyWith(color: Colors.grey),
          )
              : null,
          borderRadius: BorderRadius.circular(8).r,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(

            filled: isFilledColor??false,
            fillColor:isFilledColor??false?fillColor:null,

            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor??context.colorScheme.primary),
              borderRadius: BorderRadius.circular(10).r,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor??context.colorScheme.primary),
              borderRadius: BorderRadius.circular(10).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor??context.colorScheme.primary),
              borderRadius: BorderRadius.circular(10).r,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(10).r,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.error),
              borderRadius: BorderRadius.circular(10).r,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.error),
              borderRadius: BorderRadius.circular(10).r,
            ),
            contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
            suffixIcon: icon ?? Icon(Icons.arrow_drop_down_rounded,
                    color: items.isEmpty ? context.colorScheme.primary.withOpacity(0.3) : context.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
