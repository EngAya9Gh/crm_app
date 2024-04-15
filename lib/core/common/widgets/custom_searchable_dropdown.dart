import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomSearchableDropDown<T> extends StatelessWidget {
  const CustomSearchableDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.itemAsString,
    this.onChanged,
    this.selectedItem,
    this.filterFn,
    this.compareFn,
    this.validator,
  });

  final String hint;
  final List<T> items;
  final String Function(T?)? itemAsString;
  final void Function(T?)? onChanged;
  final T? selectedItem;
  final bool Function(T, String)? filterFn;
  final bool Function(T, T)? compareFn;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps: PopupPropsMultiSelection.dialog(
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 500),
        /*deco1*/
        // itemBuilder: (context, item, isSelected) {
        //   return Container(
        //     padding: EdgeInsets.symmetric(
        //         horizontal: 15, vertical: 8),
        //     decoration: BoxDecoration(
        //       color: isSelected
        //           ? Colors.grey.withOpacity(0.2)
        //           : Colors.transparent,
        //     ),
        //     child: Text(
        //       cart.itemAsString(item),
        //       style: Theme.of(context)
        //           .textTheme
        //           .titleSmall
        //           ?.copyWith(
        //             fontSize: 14.0,
        //           ),
        //     ),
        //   );
        // },

        /* deco2 */
        // dropdownSearchDecoration: InputDecoration(
        //   isCollapsed: true,
        //   hintText: 'نوع النشاط*',
        //   hintStyle: context.textTheme.titleSmall
        //       ?.copyWith(color: Colors.grey),
        //   contentPadding:
        //   HWEdgeInsetsDirectional.only(
        //       start: 12, end: 12),
        //   border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color:
        //         context.colorScheme.primary),
        //     borderRadius:
        //     BorderRadius.circular(10).r,
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color:
        //         context.colorScheme.primary),
        //     borderRadius:
        //     BorderRadius.circular(10).r,
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color:
        //         context.colorScheme.primary),
        //     borderRadius:
        //     BorderRadius.circular(10).r,
        //   ),
        //   disabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color:
        //         context.colorScheme.primary),
        //     borderRadius:
        //     BorderRadius.circular(10).r,
        //   ),
        //   errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: context.colorScheme.error),
        //     borderRadius:
        //     BorderRadius.circular(10).r,
        //   ),
        //   focusedErrorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: context.colorScheme.error),
        //     borderRadius:
        //     BorderRadius.circular(10).r,
        //   ),
        // ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            isCollapsed: true,
            hintText: 'العميل',
            alignLabelWithHint: true,
            fillColor: Colors.grey.withOpacity(0.2),
            contentPadding: EdgeInsets.all(0),
            border: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
            )),
      ),
      filterFn: filterFn,
      compareFn: compareFn,
      items: items,
      itemAsString: itemAsString,
      onChanged: onChanged,
      selectedItem: selectedItem,
      validator: validator,
    );
  }
}
