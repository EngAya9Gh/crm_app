import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';

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
        selectionWidget: (context, item, isSelected) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: isSelected
                ? Icon(
                    Icons.check_box,
                    color: Colors.blue,
                    size: (24.0).scaleIconsSize,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey,
                    size: (24.0).scaleIconsSize,
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
        validationWidgetBuilder: (context, item) {
          return AppElevatedButton(text: "حفظ");
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
              child: AppText(
                itemAsString!(item),
                fontSize: 18,
                style: AppStyles.textStyle.copyWith(
                  overflow: TextOverflow.ellipsis,
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
          child: AppText(
            selectedItems.isEmpty
                ? hint ?? ''
                : selectedItems
                    .map((e) => itemAsString!(e))
                    .toList()
                    .join(', '),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            color: Colors.grey,
            fontSize: 18,
          ),
        );
      },
      // button decoration
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: dropdownSearchDecoration ??
            AppStyles.roundedDropdownButtonDecoration(
              context: context,
              hintText: hint ?? '',
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
