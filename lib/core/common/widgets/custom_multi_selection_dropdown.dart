import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'app_elvated_button.dart';

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
  State<CustomMultiSelectionDropdown<T>> createState() =>
      _CustomMultiSelectionDropdownState<T>();
}

class _CustomMultiSelectionDropdownState<T>
    extends State<CustomMultiSelectionDropdown<T>> {
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<T>>();

  @override
  Widget build(BuildContext context) {
    final Widget child = DropdownSearch<T>.multiSelection(
      key: _popupCustomValidationKey,
      items: widget.items,
      selectedItems: widget.selectedItems,
      itemAsString: widget.itemAsString,
      filterFn: widget.filterFn,
      compareFn: widget.compareFn,
      onChanged: (value) {
        widget.onSave!(value);
      },
      enabled: widget.isDisabled != true,
      validator: widget.validator ??
          (widget.isRequired
              ? (value) => value == null || value.isEmpty
                  ? AppStrings.messageEmpty
                  : null
              : null),
      // suffix icon props
      dropdownButtonProps: DropdownButtonProps(
        color: widget.isDisabled == true ? Colors.grey : null,
      ),
      // popup props
      popupProps: PopupPropsMultiSelection.dialog(
        showSelectedItems: true,
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
        validationWidgetBuilder: (ctx, items) {
          return AppElevatedButton(
            text: "حفظ",
            onPressed: () {
              _popupCustomValidationKey.currentState
                  ?.changeSelectedItems(items);
              _popupCustomValidationKey.currentState?.popupOnValidate();
            },
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
            selectedItems.isEmpty
                ? widget.hint ?? ''
                : selectedItems
                    .map((e) => widget.itemAsString!(e))
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
        dropdownSearchDecoration: widget.dropdownSearchDecoration ??
            AppStyles.roundedDropdownButtonDecoration(
              context: context,
              hintText: widget.hint ?? '',
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
