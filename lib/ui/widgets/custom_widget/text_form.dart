import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class EditTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool? obscureText;
  final String hintText;
  Function(String)? onChanged;
  Function()? ontap;
  String? Function(String?)? vaildator;
  int? maxline;
  String? label;
  IconData? icon;
  TextInputType? inputType;
  bool? readOnly = null;
  EdgeInsetsGeometry? paddcustom;
  List<TextInputFormatter>? inputformate;
  FormFieldSetter<String>? onSaved;
  int? maxLength;
  int? minLines;

  EditTextFormField({
    this.ontap,
    required this.hintText,
    this.obscureText,
    required this.controller,
    this.onChanged,
    this.vaildator,
    this.label,
    this.icon,
    this.maxline,
    this.inputType,
    this.readOnly,
    this.paddcustom,
    this.onSaved,
    this.inputformate,
    this.maxLength,
    this.minLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      onChanged: onChanged,
      validator: vaildator,
      obscureText: obscureText ?? false,
      controller: controller,
      cursorColor: Colors.black,
      onTap: ontap,
      keyboardType: inputType,
      readOnly: readOnly == null ? false : true,
      inputFormatters: inputformate,
      onSaved: onSaved,
      maxLength: maxLength,
      minLines: minLines,
      decoration: InputDecoration(
        //icon: ,
        contentPadding:
            paddcustom ?? EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                color: kMainColor,
              ),
        counter: SizedBox.shrink(),
        hintStyle: const TextStyle(
            color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
      ),
    );
  }
}
