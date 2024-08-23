import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    this.onChanged,
    this.hintText,
    this.icon,
    this.con,
    this.vaild,
    this.label,
    this.inputType,
    this.maxline,
    this.onsave,
    this.ontap,
    required this.read,
    required this.radius,
    this.textdirehint,
  });

  final String? hintText;
  final TextDirection? textdirehint;
  final Function()? ontap;
  final Function(String)? onChanged;
  final Function(String?)? onsave;
  final String? Function(String?)? vaild;
  final IconData? icon;
  final TextEditingController? con;
  final String? label;
  final int? maxline;
  final TextInputType? inputType;
  final double radius;
  final bool read;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      onTap: ontap,
      validator: vaild,
      onChanged: onChanged,
      controller: con,
      keyboardType: inputType,
      onSaved: onsave,
      readOnly: read,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        hintTextDirection: textdirehint,
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.primaryColor,
        ),
        hintText: hintText,
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                color: AppColors.primaryColor,
              ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
