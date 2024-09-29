import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../app/presentation/widgets/app_text.dart';

class DrawerExpansionTile extends StatelessWidget {
  const DrawerExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
    this.icon,
    this.onExpansionChanged,
  });

  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final IconData? icon;
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: onExpansionChanged,
      title: Row(
        children: [
          if (icon != null) ...[
            AppIcon(
              icon!,
              color: AppColors.primaryMain,
            ),
            10.horizontal,
          ],
          AppText(
            title,
            style: AppStyles.regular18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      collapsedTextColor: AppColors.textPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      collapsedBackgroundColor: AppColors.white,
      collapsedIconColor: AppColors.textPrimary,
      backgroundColor: AppColors.white,
      iconColor: AppColors.textPrimary,
      initiallyExpanded: initiallyExpanded,
      expandedAlignment: Alignment.centerRight,
      // childrenPadding: EdgeInsetsDirectional.only(
      //   start: 20.scaleWidth,
      // ),
      dense: true,
      children: children,
    );
  }
}
