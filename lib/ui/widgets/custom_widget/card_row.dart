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
        if (anotherWidget == null) return SizedBox.shrink();
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFF5F5F5),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  alignment: Alignment.centerRight,
                  constraints: BoxConstraints(minHeight: 25),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppText(
                          title,
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.right,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: AppText(
              //     title,
              //     textDirection: TextDirection.rtl,
              //     fontFamily: AppFonts.fontFamily1,
              //     fontSize: 16,
              //     color: Colors.black87, //Colors.grey[600],
              //     fontWeight: FontWeight.w800,
              //     overflow: overflow,
              //   ),
              // ),
              10.width,
              Expanded(
                flex: isExpanded ? 2 : 1,
                child: anotherWidget ??
                    AppText(
                      valueString,
                      textDirection: TextDirection.rtl,
                      fontFamily: AppFonts.fontFamily1,
                      fontSize: 16,
                      color: valueFontColor ?? Colors.black87,
                      fontWeight: FontWeight.w500,
                      overflow: overflow,
                    ),
              ),
            ],
          ),
        ),
        if (withDivider) ...{
          Divider(
            thickness: 0.5,
            color: Colors.grey[300],
          ),
          1.height,
        }
      ],
    );
  }
}
