
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowEditTitle extends StatelessWidget {
  final String name;
  Color? color;
  final String des;
  final String des2;

  RowEditTitle({required this.color,required this.name, required this.des,required this.des2, Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         SizedBox(
          width: 15.0,
          height: 15.0,
          child:  DecoratedBox(
            decoration:  BoxDecoration(
                color: color
            ),
          ),
        ),
        TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: name,
          underline: TextDecoration.none,
        ),
        TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: des,
          underline: TextDecoration.none,
        ),   TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: des2,
          underline: TextDecoration.none,
        ),
      ],
    );
  }
}