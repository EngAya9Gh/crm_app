


import 'package:crm_smart/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class test_home extends StatelessWidget {
  const test_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
         Api().get(url: url+ 'products/getAllProduct.php?fk_country=1');
        },
        tooltip: 'إضافة منتج',
        child: Icon(Icons.add),
      ),
      body: Container(
        
        
      ),
    );
  }
}
