import 'package:flutter/material.dart';

class ContainerShadows extends StatelessWidget {
  double? width;
  double? height;
  Widget child;
  EdgeInsets margin;
  EdgeInsetsGeometry? padding;
  ContainerShadows(
      { this.width,
         this.height,
        required this.child,
        required this.margin,
        this.padding,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:padding==null?
      EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20):padding,
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}