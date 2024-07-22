import '../../utils/app_styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_strings.dart';

class CustomMultiSelectionDropdown<T> extends StatelessWidget {
  final List<T> items;
  final List<T> selectedItems;
  final String? hint;
  final ValueChanged<List<T>>? onSave;
  final String Function(T?)? itemAsString;
  final String? Function(List<T>?)? validator;
  final bool isRequired;
  final InputBorder? border;
  final InputDecoration? dropdownSearchDecoration;
  final bool Function(T, String)? filterFn;
  final bool Function(T, T)? compareFn;
  final void Function(List<T>, T)? onItemAdded;
  final void Function(List<T>, T)? onItemRemoved;
  final bool? isDisabled;

  const CustomMultiSelectionDropdown({
    super.key,
    required this.items,
    required this.selectedItems,
    this.hint,
    this.onSave,
    required this.itemAsString,
    this.validator,
    this.isRequired = false,
    this.border,
    this.dropdownSearchDecoration,
    this.filterFn,
    this.compareFn,
    this.onItemAdded,
    this.onItemRemoved,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final Widget widget = DropdownSearch<T>.multiSelection(
      items: items,
      selectedItems: selectedItems,
      itemAsString: itemAsString,
      filterFn: filterFn,
      compareFn: compareFn,
      onChanged: (value) {
        onSave!(value);
      },
      enabled: isDisabled != true,
      validator: validator ??
          (isRequired
              ? (value) => value == null || value.isEmpty
                  ? AppStrings.messageEmpty
                  : null
              : null),
      // suffix icon props
      dropdownButtonProps: DropdownButtonProps(
        color: isDisabled == true ? Colors.grey : null,
      ),
      // popup props
      popupProps: PopupPropsMultiSelection.dialog(
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 300),
        searchFieldProps: TextFieldProps(
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: "بحث",
            hintTextDirection: TextDirection.rtl,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        selectionWidget: (context, item, isSelected) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: isSelected
                ? Icon(
                    Icons.check_box,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey,
                  ),
          );
        },
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
        itemBuilder: (context, item, isSelected) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.transparent,
              ),
              child: Text(
                itemAsString!(item),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.0.sp,
                    ),
              ),
            ),
          );
        },
        onItemAdded: onItemAdded,
        onItemRemoved: onItemRemoved,
      ),
      // button builder
      dropdownBuilder: (context, selectedItems) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            selectedItems.isEmpty
                ? hint ?? ''
                : selectedItems
                    .map((e) => itemAsString!(e))
                    .toList()
                    .join(', '),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        );
      },
      // button decoration
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: dropdownSearchDecoration ??
            AppStyles.roundedDropdownButtonDecoration(
              context: context,
              hintText: hint ?? '',
            ),
      ),
    );

    return isDisabled == true
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isDisabled == true ? Colors.grey.shade300 : null,
            ),
            child: widget,
          )
        : widget;
  }
}
