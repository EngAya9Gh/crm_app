import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';

Widget buildcardExpansion(String title, String? subtitle, Widget items,
    {bool initiallyExpanded = false,
    Widget? subTitleWidget,
    Widget? titleWidget}) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    child: ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      subtitle: subTitleWidget ??
          (subtitle != null && subtitle.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Center(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.scaleFontSize,
                          fontFamily: AppFonts.fontFamily1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : null),
      collapsedIconColor: AppColors.primaryMain,
      textColor: AppColors.primaryMain,
      iconColor: AppColors.primaryMain,
      title: titleWidget ??
          Text(
            title,
            style: TextStyle(
                color: AppColors.primaryMain,
                fontSize: 13.scaleFontSize,
                fontFamily: AppFonts.fontFamily1,
                fontWeight: FontWeight.bold),
          ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          child: items,
        ),
      ],
    ),
  );
}
