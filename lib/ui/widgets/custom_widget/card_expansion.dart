import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';

Widget buildcardExpansion(String title, String? subtitle, Widget items,
    {bool initiallyExpanded = false}) {
  return Card(
    child: ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            subtitle!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontFamily: AppFonts.fontFamily2,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      collapsedIconColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      iconColor: AppColors.primaryColor,
      // collapsedBackgroundColor: AppColors.kMainColor,
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 13.0,
            fontFamily: AppFonts.fontFamily2,
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
