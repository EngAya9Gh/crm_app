import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
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
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey : Colors.transparent,
              ),
              child: Text(
                itemAsString(item),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12.sp,
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
            ),
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
