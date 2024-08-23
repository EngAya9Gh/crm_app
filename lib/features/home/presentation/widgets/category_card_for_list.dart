import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/common/models/page_model.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../app/presentation/widgets/app_text.dart';

class CategoryCardForList extends StatelessWidget {
  const CategoryCardForList({
    super.key,
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => AppNavigator.push(page.page),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            page.title,
            fontSize: 18,
            fontFamily: AppFonts.fontFamily1,
            color: Colors.black,
          ),
          if (page.icon != null) ...[
            Container(
              width: (60.0).scaleIconsSize,
              height: (60.0).scaleIconsSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: FaIcon(
                page.icon,
                color: AppColors.primaryColor,
                size: (35.0).scaleIconsSize,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
