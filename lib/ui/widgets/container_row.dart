
import 'package:flutter/material.dart';

import 'custom_widget/row_edit.dart';

class ContainerRow extends StatelessWidget {
  RowEdit? rowedit;

  ContainerRow({required this.rowedit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: rowedit!,
      ),
    );
  }
}