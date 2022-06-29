

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class EditTextFormField extends StatelessWidget {
  final TextEditingController controller;
   bool? obscureText=false;
  final String hintText;
  Function(String)? onChanged;
  Function()? ontap;
  String? Function(String?)? vaild;
  int? maxline;
  String? label;
  IconData? icon;
  TextInputType? inputType;
   bool? read=null;
   EdgeInsetsGeometry? paddcustom;
  List<TextInputFormatter>? inputformate;
  EditTextFormField(
       {
         this.ontap,
         required this.hintText,
         this.obscureText,
        required this.controller,
        this.onChanged,
        this.vaild,
         this.label,
         this.icon,
         this.maxline,
         this.inputType,
         this.read,
         this.paddcustom,

         this.inputformate,
        Key? key
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
      maxLines:maxline ,
      onChanged: onChanged,
      validator: vaild,
      obscureText: false,
      controller: controller,
      cursorColor: Colors.black,
      onTap: ontap,
      keyboardType: inputType,
      readOnly: read==null?false:true,
      inputFormatters: inputformate,
      decoration: InputDecoration(
      //icon: ,
        contentPadding:
        paddcustom==null?
         EdgeInsets.all(2):paddcustom,
        prefixIcon: Icon(
          icon,
          color: kMainColor,
        ),
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