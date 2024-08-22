import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

AppBar CustomAppBar({
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: AppText(
      title,
      color: AppColors.kWhiteColor,
      fontSize: (22.0).scaleFontSize,
      fontFamily: AppFonts.fontFamily2,
    ),
    centerTitle: true,
    actions: actions,
  );
}
