import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_navigator.dart';

AppBar CustomAppBar({
  String? title,
  List<Widget>? actions,
  Color? backgroundColor,
}) {
  return AppBar(
    title: title == null
        ? null
        : AppText(
            title,
            color: AppColors.kWhiteColor,
            fontSize: (22.0).scaleFontSize,
            fontFamily: AppFonts.fontFamily2,
          ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.kWhiteColor,
        size: (25.0).scaleIconsSize,
      ),
      onPressed: () => AppNavigator.pop(),
    ),
    actions: actions,
    backgroundColor: backgroundColor,
  );
}
