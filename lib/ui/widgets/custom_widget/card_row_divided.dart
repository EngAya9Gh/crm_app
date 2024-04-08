import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
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
              child: Text(
                value!,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: kfontfamily2,
                ),
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        : Flexible(
            child: Text(
              value!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: kfontfamily2,
              ),
            ),
          );
  }
}
