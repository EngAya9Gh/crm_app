import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

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
    actions: actions,
    backgroundColor: backgroundColor,
  );
}
