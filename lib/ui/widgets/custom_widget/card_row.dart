import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../features/app/presentation/widgets/app_text.dart';

class CardRow extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final String title;
  final dynamic value;
  final bool isExpanded;
  final bool withDivider;
  final bool showEmpty;

  CardRow({
    super.key,
    this.alignment,
    required this.value,
    required this.title,
    this.isExpanded = true,
    this.withDivider = true,
    this.showEmpty = false,
  });

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
              child: AppText(
                title,
                textDirection: TextDirection.rtl,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.fontFamily2,
              ),
            ),
            50.width,
            isExpanded == true
                ? Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                        HelperFunctions.getNameShort(valueString),
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.fontFamily2,
                      ),
                    ))
                : AppText(
                    HelperFunctions.getNameShort(valueString),
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.fontFamily2,
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
