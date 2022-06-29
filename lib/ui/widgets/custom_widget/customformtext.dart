import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:intl/intl.dart';

import '../../../constants.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({

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

  String? hintText;
  TextDirection? textdirehint;
  Function()? ontap;
  Function(String)? onChanged;
  Function(String?)? onsave;
  String? Function(String?)? vaild;
  IconData? icon;
  TextEditingController? con;
  String? label;
  int? maxline;
  TextInputType? inputType;
  double radius;
  bool read=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: maxline,
onTap: ontap,
      //textDirection: TextDirection.rtl,
      validator: vaild,
      onChanged: onChanged,
      controller: con,
      keyboardType: inputType,
onSaved: onsave,
      /*inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],*/
      readOnly: read,
      decoration: InputDecoration(
        hintTextDirection: textdirehint,
        alignLabelWithHint: true,

        labelText: label,
        labelStyle: TextStyle(color: kMainColor,),
        hintText: hintText,

        prefixIcon: Icon(
          icon,
          color: kMainColor,
        ),
        filled: true,
        fillColor: Colors.white,
        // hintStyle: const TextStyle(
        //     color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
        //filled: false,
        //fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
