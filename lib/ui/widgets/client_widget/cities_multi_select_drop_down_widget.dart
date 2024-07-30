import 'package:flutter/material.dart';

import '../../../core/common/widgets/custom_multi_selection_dropdown.dart';

class CitiesMultiSelectDropDownWidget<T> extends StatelessWidget {
  const CitiesMultiSelectDropDownWidget({
    Key? key,
    required this.items,
    required this.selectedItems,
    required this.itemAsString,
    required this.onChanged,
    required this.hint,
    this.style2 = false,
  });

  final List<T> items;
  final List<T> selectedItems;
  final String Function(T?)? itemAsString;
  final void Function(List<T>) onChanged;
  final String hint;
  final bool style2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: CustomMultiSelectionDropdown<T>(
        hint: hint,
        items: items,
        itemAsString: itemAsString,
        selectedItems: selectedItems,
        onSave: onChanged,
        isRequired: true,
        dropdownSearchDecoration: style2
            ? null
            : InputDecoration(
                isCollapsed: true,
                alignLabelWithHint: true,
                fillColor: Colors.grey.withOpacity(0.2),
                contentPadding: EdgeInsets.all(0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ).copyWith(
                hintText: hint,
              ),
      ),
    );
  }
}
