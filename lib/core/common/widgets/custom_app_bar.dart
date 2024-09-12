import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../config/navigator/app_navigator.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'app_icon.dart';

AppBar CustomAppBar({
  String? title,
  List<Widget>? actions,
  Color? backgroundColor,
  Color? leadingColor,
  Color? leadingBackgroundColor,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    title: title == null
        ? null
        : AppText(
            title,
            color: AppColors.kWhiteColor,
            fontSize: 22,
            fontFamily: AppFonts.fontFamily2,
          ),
    centerTitle: true,
    leading: _leading(leadingBackgroundColor, leadingColor),
    actions: actions,
    backgroundColor: backgroundColor,
    bottom: bottom,
  );
}

Widget _leading(Color? leadingBackgroundColor, Color? leadingColor) {
  final Widget child = IconButton(
    icon: AppIcon(
      Icons.arrow_back,
      color: leadingColor ?? AppColors.kWhiteColor,
    ),
    onPressed: () => AppNavigator.pop(),
  );
  if (leadingBackgroundColor == null) return child;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipOval(
      child: ColoredBox(
        color: leadingBackgroundColor,
        child: child,
      ),
    ),
  );
}
