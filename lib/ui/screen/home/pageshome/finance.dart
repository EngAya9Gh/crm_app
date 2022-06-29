import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgethomeitem.dart';

class financepage extends StatelessWidget {
  const financepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'التحصيل',
          style: TextStyle(color: kWhiteColor,
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Column(children: [
          buildSelectCategory(

              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {

          }, title: ''),
          buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {  }, title: ''),

        ],),

      ),
    );
  }
}
