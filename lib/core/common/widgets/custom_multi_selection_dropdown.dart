import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_strings.dart';

class CustomMultiSelectionDropdown<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selectedItems;
  final String? hint;
  final ValueChanged<List<T>>? onChanged;
  final String Function(T?)? itemAsString;
  final String? Function(List<T>?)? validator;
  final bool isRequired;
  final InputBorder? border;

  CustomMultiSelectionDropdown({
    required this.items,
    required this.selectedItems,
    this.hint,
    this.onChanged,
    this.itemAsString,
    this.validator,
    this.isRequired = false,
    this.border,
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
      // button
      dropdownBuilder: (context, selectedItems) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
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
      // search
      searchDelay: Duration(milliseconds: 500),
      dropdownSearchDecoration: InputDecoration(
        isCollapsed: true,
        alignLabelWithHint: true,
        fillColor: Colors.grey.withOpacity(0.2),
        contentPadding: EdgeInsets.zero,
        border: widget.border ?? InputBorder.none,
        hintText: widget.hint,
      ),
      // popup
      popupItemBuilder: (context, item, isSelected) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
          ),
          child: Text(
            widget.itemAsString!(item),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14.0.sp,
                ),
          ),
        );
      },
      // others
      mode: Mode.DIALOG,
      items: widget.items,
      selectedItems: widget.selectedItems,
      itemAsString: widget.itemAsString,
      onChanged: widget.onChanged,
      showSearchBox: true,
      validator: widget.validator ??
          (widget.isRequired
              ? (value) => value == null || value.isEmpty
                  ? AppStrings.messageEmpty
                  : null
              : null),
    );
  }
}
