import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../view_model/maincity_vm.dart';

class CitiesMultiSelectDropDownWidget<T> extends StatelessWidget {
  const CitiesMultiSelectDropDownWidget({
    Key? key,
    required this.provider,
    required this.items,
    required this.selectedItems,
    required this.itemAsString,
    required this.onChanged,
    required this.hint,
  });

  final MainCityProvider provider;
  final List<T> items;
  final List<T> selectedItems;
  final String Function(T?)? itemAsString;
  final void Function(List<T>) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: DropdownSearch<T>.multiSelection(
        mode: Mode.DIALOG,
        items: items,
        selectedItems: selectedItems,
        itemAsString: itemAsString,
        onChanged: onChanged,
        showSearchBox: true,
        dropdownSearchDecoration: InputDecoration(
          isCollapsed: true,
          alignLabelWithHint: true,
          fillColor: Colors.grey.withOpacity(0.2),
          contentPadding: EdgeInsets.all(0),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ).copyWith(
          hintText: 'المنطقة',
        ),
      ),
    );
  }
}
