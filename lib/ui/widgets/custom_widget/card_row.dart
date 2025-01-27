import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_fonts.dart';
import '../../../features/app/presentation/widgets/app_text.dart';

class CardRow extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final String title;
  final dynamic value;
  final Color? valueFontColor;
  final bool isExpanded;
  final bool withDivider;
  final bool showEmpty;
  final TextOverflow? overflow;
  final Widget? anotherWidget;

  const CardRow({
    super.key,
    this.alignment,
    this.valueFontColor,
    this.value,
    required this.title,
    this.isExpanded = true,
    this.withDivider = true,
    this.showEmpty = false,
    this.overflow,
    this.anotherWidget,
  });

  @override
  Widget build(BuildContext context) {
    String? valueString = value.toString();
    if (valueString == "null" || valueString.isEmpty) {
      if (showEmpty) {
        valueString = "لا يوجد";
      } else {
        if(anotherWidget==null)
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
              child: AppText(
                title,
                textDirection: TextDirection.rtl,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.fontFamily1,
                overflow: overflow,
              ),
            ),
            50.width,
            Flexible(
              child:anotherWidget?? AppText(
                valueString,
                fontWeight: FontWeight.w500,
                color: valueFontColor,
                fontFamily: AppFonts.fontFamily1,
                overflow: overflow,
              ),
            ),
          ],
        ),
        if (withDivider) ...{
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          5.height,
        }
      ],
    );
  }
}
