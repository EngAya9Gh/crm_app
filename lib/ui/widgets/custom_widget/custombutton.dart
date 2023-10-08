import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.text, this.width, this.icon});

  VoidCallback? onTap;
  double? width;
  String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: width,
        height: 40,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               if(icon != null) ...{
                 Icon(icon,color: Colors.white),
                 SizedBox(width: 10),
               },
                Text(
                  text!,
                  style: TextStyle(color: kWhiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
