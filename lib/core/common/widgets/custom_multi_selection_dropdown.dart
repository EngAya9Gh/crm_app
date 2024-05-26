import 'package:dropdown_button2/dropdown_button2.dart';
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
  Widget build(BuildContext context) {
    return DropdownSearch<T>.multiSelection(
      items: items,
      selectedItems: selectedItems,
      itemAsString: itemAsString,
      filterFn: filterFn,
      compareFn: compareFn,
      onChanged: (value) {
        print("value => $value");
        onSave!(value);
      },
      validator: validator ??
          (isRequired
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
              itemAsString!(item),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.0.sp,
                  ),
            ),
          );
        },
        onItemAdded: onItemAdded,
        onItemRemoved: onItemRemoved,
      ),
      // button
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
                  fontSize: 12.0.sp,
                ),
          ),
        );
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: dropdownSearchDecoration ??
            InputDecoration(
              isCollapsed: true,
              alignLabelWithHint: true,
              fillColor: Colors.grey.withOpacity(0.2),
              contentPadding: EdgeInsets.zero,
              border: border ?? InputBorder.none,
              hintText: hint,
            ),
      ),
    );
  }
}

class SearchableMultiSelectionDropdown extends StatefulWidget {
  final List<dynamic> items;
  final List<dynamic> selectedItems;
  final String? hint;
  final ValueChanged<List<dynamic>>? onSave;
  final ValueChanged<dynamic>? onChanged;
  final String Function(dynamic)? itemAsString;
  final String? Function(List<dynamic>?)? validator;
  final bool isRequired;
  final InputBorder? border;
  final InputDecoration? dropdownSearchDecoration;
  final bool Function(dynamic, String)? filterFn;
  final bool Function(dynamic, dynamic)? compareFn;
  final void Function(List<dynamic>, dynamic)? onItemAdded;
  final void Function(List<dynamic>, dynamic)? onItemRemoved;

  const SearchableMultiSelectionDropdown({
    required this.items,
    required this.selectedItems,
    this.hint,
    this.onSave,
    this.onChanged,
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
  State<SearchableMultiSelectionDropdown> createState() =>
      SearchableMultiSelectionDropdownState();
}

class SearchableMultiSelectionDropdownState
    extends State<SearchableMultiSelectionDropdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(widget.hint ?? ''),
          items: widget.items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = widget.selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      isSelected
                          ? widget.selectedItems.remove(item)
                          : widget.selectedItems.add(item);
                      //This rebuilds the StatefulWidget to update the button's text
                      setState(() {});
                      //This rebuilds the dropdownMenu Widget to update the check mark
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          isSelected
                              ? const Icon(Icons.check_box_outlined)
                              : const Icon(Icons.check_box_outline_blank),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              widget.itemAsString!(item),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          onChanged: widget.onChanged,
          selectedItemBuilder: (context) {
            return widget.selectedItems.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.itemAsString!(item),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              );
            }).toList();
          },
          customButton: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              widget.selectedItems.isEmpty
                  ? widget.hint ?? ''
                  : widget.selectedItems
                      .map((e) => widget.itemAsString!(e))
                      .toList()
                      .join(', '),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12.0.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
