import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_strings.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.searchController,
    this.hint,
    this.onChanged,
    this.margin,
    this.keyboardType,
  });

  final TextEditingController searchController;
  final String? hint;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.grey.shade200;
    return Container(
      height: (50.0).scaleHeight,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: TextField(
        keyboardType: keyboardType,
        controller: searchController,
        onChanged: onChanged,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: (16.0).scaleFontSize,
        ),
        decoration: InputDecoration(
          hintText: hint ?? AppStrings.global.searchHint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: (14.0).scaleFontSize,
          ),
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          filled: true,
          // fillColor: color,

          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          fillColor: Colors.grey[100],

          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius
          //       .circular(10)
          //       .r,
          //   borderSide: BorderSide(color: Colors.grey.shade300),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius
          //       .circular(10)
          //       .r,
          //   borderSide: BorderSide(color: Colors.grey.shade300),
          // ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius
          //       .circular(10)
          //       .r,
          //   borderSide: BorderSide(color: color),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius
          //       .circular(10)
          //       .r,
          //   borderSide: BorderSide(color: Colors.red),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius
          //       .circular(10)
          //       .r,
          //   borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
