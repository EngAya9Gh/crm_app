import 'package:flutter/material.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';

class SectionWithAction extends StatelessWidget {
  const SectionWithAction({
    super.key,
    required this.title,
    required this.onAddPressed,
    required this.child,
    this.addButtonText,
    this.backgroundColor = const Color(0x00000000), // transparent
    this.textColor,
    this.iconColor,
  });

  final String title;
  final VoidCallback onAddPressed;
  final Widget child;
  final String? addButtonText;
  final Color backgroundColor;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title,
              fontSize: 14.scaleFontSize,
              fontWeight: FontWeight.w500,
            ),
            TextButton.icon(
              onPressed: onAddPressed,
              icon: Icon(Icons.add, color: iconColor ?? AppColors.primaryMain),
              label: AppText(
                fontSize: 14.scaleFontSize,
                addButtonText ??
                    title, //' ${title.substring(0, title.length - 1)}',
                color: textColor ?? AppColors.primaryMain,
                overflow: TextOverflow.visible,
              ),
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              ),
            ),
          ],
        ),
        4.height,
        child,
      ],
    );
  }
}
