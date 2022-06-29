

import 'dart:ui';

import 'package:flutter/cupertino.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class TextUtilis extends StatelessWidget {
  Color color;
  double fontSize;
  FontWeight fontWeight;
  String textstring;
  TextDecoration underline;

  // ignore: prefer_const_constructors_in_immutables
  TextUtilis(
      {required this.color,
        required this.fontSize,
        required this.fontWeight,
        required this.textstring,
        required this.underline,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      textstring,
      style:
      //GoogleFonts.lato(
           TextStyle(
            color: color,
            fontWeight: fontWeight,
            decoration: underline,
        fontFamily: kfontfamily2
      //    )
      ),
    );
  }
}