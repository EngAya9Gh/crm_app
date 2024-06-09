import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_styles.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.itemAsString,
    this.onChanged,
    this.selectedItem,
    this.validator,
    this.buttonDecoration,
    this.height,
    this.width,
    this.itemAsIcon,
    this.padding,
  });

  final String hint;
  final List<T> items;
  final String Function(T?) itemAsString;
  final void Function(T?)? onChanged;
  final T? selectedItem;
  final String? Function(T?)? validator;
  final InputDecoration? buttonDecoration;
  final double? height;
  final double? width;

  // icon functionality
  final Icon Function(T?)? itemAsIcon;
  // padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    int idx = -1;
    return DropdownSearch<T>(
      items: items,
      itemAsString: itemAsString,
      onChanged: onChanged,
      selectedItem: selectedItem,
      validator: validator,
      popupProps: PopupProps.menu(
        containerBuilder: (context, child) {
          return Padding(
            padding: padding ?? EdgeInsets.zero,
            child: SizedBox(
              height: height ?? MediaQuery.of(context).size.height * 0.6,
              child: child,
            ),
          );
        },
        menuProps: MenuProps(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        itemBuilder: (context, item, isSelected) {
          Widget child = Container(
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
          );
          final icon = itemAsIcon?.call(item);
          if (icon != null) {
            child = Row(
              children: [
                Spacer(),
                child,
                SizedBox(width: 10),
                itemAsIcon!(item),
              ],
            );
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child,
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
    );
  }
}
