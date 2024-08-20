import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_styles.dart';
import '../helpers/input_validator.dart';

class CustomSearchableDropDown<T> extends StatelessWidget {
  const CustomSearchableDropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.itemAsString,
    this.onChanged,
    this.selectedItem,
    required this.filterFn,
    this.compareFn,
    this.validator,
    this.buttonDecoration,
    this.itemBuilder,
    this.isRequired = false,
  });

  final String hint;
  final List<T> items;
  final String Function(T?) itemAsString;
  final void Function(T?)? onChanged;
  final T? selectedItem;
  final bool Function(T, String)? filterFn;
  final bool Function(T, T)? compareFn;
  final String? Function(T?)? validator;
  final InputDecoration? buttonDecoration;
  final Widget Function(BuildContext, T, bool)? itemBuilder;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps: PopupPropsMultiSelection.dialog(
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 500),
        searchFieldProps: TextFieldProps(
          textDirection: TextDirection.rtl,
          style: AppStyles.textStyle.copyWith(
            fontSize: (18.0).scaleFontSize,
          ),
          decoration: InputDecoration(
            hintText: "بحث",
            hintTextDirection: TextDirection.rtl,
            hintStyle: AppStyles.textStyle.copyWith(
              fontSize: (18.0).scaleFontSize,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        containerBuilder: (context, child) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: child,
          );
        },
        dialogProps: DialogProps(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
        ),
        itemBuilder: itemBuilder ??
            (context, item, isSelected) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.grey : Colors.transparent,
                  ),
                  child: AppText(
                    itemAsString(item),
                    fontSize: 18,
                    style: AppStyles.textStyle.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        textAlignVertical: TextAlignVertical.center,
        dropdownSearchDecoration: buttonDecoration ??
            AppStyles.roundedDropdownButtonDecoration(
              context: context,
              hintText: hint,
            ).copyWith(
              hintStyle: AppStyles.textStyle.copyWith(
                fontSize: (18.0).scaleFontSize,
                color: Colors.grey,
              ),
            ),
        baseStyle: AppStyles.textStyle.copyWith(
          fontSize: (18.0).scaleFontSize,
        ),
      ),
      filterFn: filterFn,
      compareFn: compareFn,
      items: items,
      itemAsString: itemAsString,
      onChanged: onChanged,
      selectedItem: selectedItem,
      validator:
          validator ?? (isRequired ? InputValidator.requiredFiled : null),
    );
  }
}
