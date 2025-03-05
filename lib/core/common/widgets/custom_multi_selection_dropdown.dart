import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'app_elevated_button.dart';
import 'app_icon.dart';

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
  final bool Function(T, T) compareFn;
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
    required this.compareFn,
    this.onItemAdded,
    this.onItemRemoved,
    this.isDisabled,
  });

  @override
  State<CustomMultiSelectionDropdown<T>> createState() => _CustomMultiSelectionDropdownState<T>();
}

class _CustomMultiSelectionDropdownState<T> extends State<CustomMultiSelectionDropdown<T>> {
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<T>>();

  @override
  Widget build(BuildContext context) {
    final Widget child = DropdownSearch<T>.multiSelection(
      key: _popupCustomValidationKey,
      items: (filter, loadProps) => widget.items,
      selectedItems: widget.selectedItems,
      itemAsString: widget.itemAsString,
      filterFn: widget.filterFn,
      compareFn: widget.compareFn,
      onChanged: (value) {
        widget.onSave!(value);
      },
      enabled: widget.isDisabled != true,
      validator: widget.validator ?? (widget.isRequired ? (value) => value == null || value.isEmpty ? AppStrings.messageEmpty : null : null),
      // suffix icon props
      suffixProps: DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(color: widget.isDisabled == true ? Colors.grey : null),
      ),
      // popup props
      popupProps: PopupPropsMultiSelection.dialog(
        showSelectedItems: true,
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 300),
        searchFieldProps: TextFieldProps(
          textDirection: TextDirection.rtl,
          style: AppStyles.textStyle.copyWith(
            fontSize: 18.scaleFontSize,
          ),
          decoration: InputDecoration(
            hintText: "بحث",
            hintTextDirection: TextDirection.rtl,
            hintStyle: AppStyles.textStyle.copyWith(
              fontSize: 18.scaleFontSize,
              color: Colors.grey,
            ),
            errorStyle: AppStyles.textStyle.copyWith(
              fontSize: 18.scaleFontSize,
              color: Colors.red,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          strutStyle: StrutStyle(
            fontSize: 18.scaleFontSize,
          ),
        ),
        checkBoxBuilder: (context, item, isDisabled, isSelected) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: isSelected
                ? AppIcon(
                    Icons.check_box,
                    color: Colors.blue,
                  )
                : AppIcon(
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
        validationBuilder: (ctx, items) {
          return AppElevatedButton(
            text: "حفظ",
            onPressed: () {
              _popupCustomValidationKey.currentState?.changeSelectedItems(items);
              _popupCustomValidationKey.currentState?.popupOnValidate();
            },
          );
        },
        errorBuilder: (context, error, onClear) {
          return AppText(
            error,
            color: Colors.red,
            fontSize: 14,
          );
        },
        dialogProps: DialogProps(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.grey),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
        ),
        itemBuilder: (context, item, isDisabled, isSelected) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
              ),
              child: AppText(
                widget.itemAsString!(item),
                fontSize: 18,
                style: AppStyles.textStyle.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
        onItemAdded: widget.onItemAdded,
        onItemRemoved: widget.onItemRemoved,
      ),
      // button builder
      dropdownBuilder: (context, selectedItems) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: AppText(
            selectedItems.isEmpty ? widget.hint ?? '' : selectedItems.map((e) => widget.itemAsString!(e)).toList().join(', '),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            color: Colors.grey,
            fontSize: 18,
          ),
        );
      },
      // button decoration
      decoratorProps: DropDownDecoratorProps(
        decoration: widget.dropdownSearchDecoration ??
            AppStyles.roundedDropdownButtonDecoration(
              context: context,
              hintText: widget.hint ?? '',
            ).copyWith(
              hintStyle: AppStyles.textStyle.copyWith(
                fontSize: 18.scaleFontSize,
                color: Colors.grey,
              ),
            ),
        baseStyle: AppStyles.textStyle.copyWith(
          fontSize: 18.scaleFontSize,
        ),
      ),
    );

    return widget.isDisabled == true
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.isDisabled == true ? Colors.grey.shade300 : null,
            ),
            child: child,
          )
        : child;
  }
}
