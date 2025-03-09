import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.itemAsString,
    this.onChanged,
    this.selectedItem,
    this.validator,
    this.buttonDecoration,
    this.height,
    this.width,
    this.itemAsIcon,
    this.padding,
    this.label,
    this.isDisabled = false,required this.compareFn,
  });

  final String hint;
  final List<T> items;
  final String Function(T?) itemAsString;
  final void Function(T?)? onChanged;
  final T? selectedItem;
  final String? Function(T?)? validator;
  final InputDecoration? buttonDecoration;
  final double? height;
  final double? width;
  final String? label;
  final bool isDisabled;
  final Icon Function(T?)? itemAsIcon;
  // TODO MAKE REQUIRED
  final bool Function(T, T) compareFn;

  // padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisabled,
      child: DropdownSearch<T>(
        items: (filter, loadProps) => items,
        itemAsString: itemAsString,
        compareFn:compareFn,
        onChanged: isDisabled ? null : onChanged,
        selectedItem: selectedItem,
        validator: validator,
        popupProps: PopupProps.menu(
          containerBuilder: (context, child) {
            return Padding(
              padding: padding ?? EdgeInsets.zero,
              child: SizedBox(
                width: width,
                height: height ?? MediaQuery.of(context).size.height * 0.6,
                child: child,
              ),
            );
          },
          menuProps: MenuProps(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          itemBuilder: (context, item, isDisabled, isSelected) {
            Widget child = Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey : Colors.transparent,
              ),
              child: AppText(
                itemAsString(item),
                fontSize: 18,
              ),
            );
            final icon = itemAsIcon?.call(item);
            if (icon != null) {
              child = Row(
                children: [
                  child,
                  Spacer(),
                  itemAsIcon!(item),
                ],
              );
            }
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child,
            );
          },
        ),
        decoratorProps: DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          decoration: _dropdownSearchDecoration(context),
          baseStyle: AppStyles.textStyle.copyWith(
            fontSize: 18.scaleFontSize,
          ),
        ),
      ),
    );
  }

  InputDecoration _dropdownSearchDecoration(BuildContext context) {
    if (isDisabled) {
      if (buttonDecoration != null) {
        return buttonDecoration!.copyWith(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          hintStyle: AppStyles.textStyle.copyWith(
            fontSize: 18.scaleFontSize,
            color: Colors.grey,
          ),
        );
      }

      return AppStyles.roundedDropdownButtonDecoration(
        context: context,
        hintText: hint,
      ).copyWith(
        hintStyle: AppStyles.textStyle.copyWith(
          fontSize: 18.scaleFontSize,
          color: Colors.grey,
        ),
        label: label != null
            ? AppText(
                label,
                fontSize: 18.scaleFontSize,
                color: Colors.grey,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return buttonDecoration ??
        AppStyles.roundedDropdownButtonDecoration(
          context: context,
          hintText: hint,
        ).copyWith(
          hintStyle: AppStyles.textStyle.copyWith(
            fontSize: 18.scaleFontSize,
            color: Colors.grey,
          ),
          label: label != null
              ? AppText(
                  label,
                  fontSize: 18.scaleFontSize,
                  color: Colors.grey,
                )
              : null,
        );
  }
}
