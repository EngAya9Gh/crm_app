import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../app/presentation/widgets/app_text.dart';

class SectionCardForGrid extends StatelessWidget {
  const SectionCardForGrid({
    super.key,
    required this.page,
  });

  final SectionModel page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppCardContainer(
        child: InkWell(
          onTap: () {
            AppNavigator.go(page.page, name: page.path);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (page.icon != null) ...[
                      Container(
                        width: 60.scaleIconsSize,
                        height: (60.0).scaleIconsSize,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryMain.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: FaIcon(
                          page.icon,
                          color: AppColors.primaryMain,
                          size: (35.0).scaleIconsSize,
                        ),
                      ),
                    ],
                    SizedBox(height: 5),
                    AppText(
                      page.title,
                      fontSize: 18,
                      fontFamily: AppFonts.fontFamily3,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
