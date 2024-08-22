import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_colors.dart';

AppBar CustomAppBar({
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: AppText(
      title,
      color: AppColors.kWhiteColor,
      fontSize: (22.0).scaleFontSize,
      fontFamily: kfontfamily2,
    ),
    centerTitle: true,
    actions: actions,
  );
}
