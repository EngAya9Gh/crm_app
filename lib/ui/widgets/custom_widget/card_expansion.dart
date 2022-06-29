

import 'package:crm_smart/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildcardExpansion( String title,String? subtitle, Widget items) {
  return Card(
    child: ExpansionTile(
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(subtitle!,  style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontFamily: kfontfamily2,
              fontWeight: FontWeight.bold),),
        ),
      ),
      collapsedIconColor: kMainColor,
      textColor: kMainColor,
      iconColor: kMainColor,
      // collapsedBackgroundColor: kMainColor,
      title: Text(
        title,
        style: TextStyle(
            color: kMainColor,
            fontSize: 13.0,
            fontFamily: kfontfamily2,
            fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        items
        // ListTile(
        //   title: Text(
        //     items.description,
        //     style: TextStyle(fontWeight: FontWeight.w700),
        //   ),
        // )
      ],
    ),
  );
}