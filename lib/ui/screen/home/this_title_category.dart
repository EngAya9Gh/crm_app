import 'package:crm_smart/constants.dart';
import 'package:crm_smart/constantsList.dart';
import 'package:flutter/material.dart';

class ThisTitleCategory extends StatelessWidget {
  final int index;
  final List list;
  const ThisTitleCategory({required this.index, required this.list, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text(list[index],  style: TextStyle(
            fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(list[index]),
      ),
    );
  }
}
