import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_fonts.dart';

class CardRowDivided extends StatelessWidget {
  CardRowDivided({
    this.alignment,
    required this.value,
    required this.title,
    this.isExpanded,
    Key? key,
    this.maxLines = 1,
    this.valueAsWidget,
    this.crossAxisAlignment,
  }) : super(key: key);
  var alignment;
  String title;
  String? value;
  bool? isExpanded = false;
  final int maxLines;
  final Widget? valueAsWidget;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    if (value == null || value == "null" || value!.isEmpty) {
      return SizedBox.shrink();
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.spaceBetween,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AppText(
                title,
                fontSize: 18,
              ),
            ),
            valueAsWidget != null
                ? valueAsWidget!
                : isExpanded == true
                    ? Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: _handleMultiLinesText(context),
                        ))
                    : _handleMultiLinesText(context),
          ],
        ),
      ],
    );
  }

  Widget _handleMultiLinesText(BuildContext context) {
    return maxLines > 1
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Flexible(
              child: AppText(
                value!,
                textDirection: TextDirection.ltr,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.fontFamily2,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          )
        : Flexible(
            child: AppText(
              value!,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.fontFamily2,
              textAlign: TextAlign.end,
            ),
          );
  }
}
