
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String name;
  final String des;
  const RowWidget({required this.name, required this.des, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.black38,
          thickness: 1,
        ),
      ],
    );
  }
}