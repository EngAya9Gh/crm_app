import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../constantsList.dart';
import '../build_card.dart';

class sales extends StatefulWidget {
  const sales({Key? key}) : super(key: key);

  @override
  _salesState createState() => _salesState();
}

class _salesState extends State<sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'المبيعات',
          style: TextStyle(
            color: kWhiteColor,
            fontFamily: kfontfamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BuildCard(
            imageList: imageList_sales,
            itemCategory: itemCategory_sales,
            type: 'sales',
          ),
        ),
      ),
    );
  }
}
