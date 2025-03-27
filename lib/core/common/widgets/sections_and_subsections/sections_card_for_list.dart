import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_routes_paths.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../config/navigator/app_navigator.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/end_points.dart';
import '../../helpers/helper_functions.dart';
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
      child: Stack(
        children: [
          AppCardContainer(
            onTap: () async {
              if (page.path.startsWith(EndPoints.baseUrls.urlWebPage)) {
                await HelperFunctions.urlLauncher(
                  page.path,
                  isNewTab: true,
                );
                return;
              } else if ((MediaQuery.of(context).size.width < 600)) {
                AppNavigator.go(page.page, name: page.path, isNew: false);
              } else {
                AppNavigator.go(page.page, name: page.path);
              }
            },
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
              ],
            ),
          ),
          if (page.path == AppRoutesPaths.homeSections.taskManagement)
            Consumer<UserProvider>(
              builder: (context, value, child) => (value.currentUser.noOfOpenTasks ?? 0) == 0
                  ? SizedBox.shrink()
                  : PositionedDirectional(
                      start: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 14,
                        child: AppText(
                          value.currentUser.noOfOpenTasks,
                          color: AppColors.white,
                        ),
                        backgroundColor: AppColors.statusErrorActive,
                      )),
            ),
        ],
      ),
    );
  }
}
