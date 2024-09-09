import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../config/navigator/app_navigator.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../models/sections/section_model.dart';
import '../app_card_container.dart';

class SectionsCardForList extends StatelessWidget {
  const SectionsCardForList({
    super.key,
    required this.page,
  });

  final SectionModel page;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppCardContainer(
        onTap: () => AppNavigator.push(page.page, path: page.path),
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
                width: 60.scaleIconsSize,
                height: 60.scaleIconsSize,
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
      ),
    );
  }
}
