import 'package:flutter/material.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/utils/app_fonts.dart';

class CardRow extends StatelessWidget {
  CardRow({
    this.alignment,
    required this.value,
    required this.title,
    this.isExpanded = true,
    Key? key,
    this.withDivider = true,
    this.showEmpty = false,
  }) : super(key: key);
  final MainAxisAlignment? alignment;
  final String title;
  final dynamic value;
  final bool isExpanded;
  final bool withDivider;
  final bool showEmpty;

  @override
  Widget build(BuildContext context) {
    String? valueString = value.toString();
    if (valueString == "null" || valueString.isEmpty) {
      if (showEmpty) {
        valueString = "لا يوجد";
      } else {
        return SizedBox.shrink();
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Flexible(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2,
                ),
              ),
            ),
            SizedBox(width: 50),
            isExpanded == true
                ? Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          HelperFunctions.getNameShort(valueString),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFonts.fontFamily2),
                        )))
                : Text(
                    HelperFunctions.getNameShort(valueString),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.fontFamily2),
                  ),
          ],
        ),
        if (withDivider) ...{
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
        }
      ],
    );
  }
}
