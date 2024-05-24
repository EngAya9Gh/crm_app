import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_strings.dart';

class CustomMultiSelectionDropdown<T> extends StatefulWidget {
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
  });

  @override
  _CustomMultiSelectionDropdownState<T> createState() =>
      _CustomMultiSelectionDropdownState<T>();
}

class _CustomMultiSelectionDropdownState<T>
    extends State<CustomMultiSelectionDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>.multiSelection(
      items: widget.items,
      selectedItems: widget.selectedItems,
      itemAsString: widget.itemAsString,
      filterFn: widget.filterFn,
      compareFn: widget.compareFn,
      onChanged: widget.onSave,
      validator: widget.validator ??
          (widget.isRequired
              ? (value) => value == null || value.isEmpty
                  ? AppStrings.messageEmpty
                  : null
              : null),
      // dialog
      popupProps: PopupPropsMultiSelection.dialog(
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 500),
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
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.transparent,
            ),
            child: Text(
              widget.itemAsString!(item),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.0.sp,
                  ),
            ),
          );
        },
        onItemAdded: widget.onItemAdded,
        onItemRemoved: widget.onItemRemoved,
      ),
      // button
      dropdownBuilder: (context, selectedItems) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            selectedItems.isEmpty
                ? widget.hint ?? ''
                : selectedItems
                    .map((e) => widget.itemAsString!(e))
                    .toList()
                    .join(', '),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12.0.sp,
                ),
          ),
        );
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: widget.dropdownSearchDecoration ??
            InputDecoration(
              isCollapsed: true,
              alignLabelWithHint: true,
              fillColor: Colors.grey.withOpacity(0.2),
              contentPadding: EdgeInsets.zero,
              border: widget.border ?? InputBorder.none,
              hintText: widget.hint,
            ),
      ),
    );
  }
}
