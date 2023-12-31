import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowEdit extends StatelessWidget {
  final String name;
  final String? des;
  final MainAxisAlignment mainAxisAlignment;

  const RowEdit({
    required this.name,
    this.des,
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: name,
          underline: TextDecoration.none,
        ),
        if (des != null)
          TextUtilis(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w800,
            textstring: des!,
            underline: TextDecoration.none,
          ),
      ],
    );
  }
}
