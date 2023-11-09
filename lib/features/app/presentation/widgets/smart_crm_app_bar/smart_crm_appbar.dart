import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_text.dart';

part 'app_bar_params.dart';

class SmartCrmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SmartCrmAppBar({
    Key? key,
    required this.appBarParams,
  }) : super(key: key);

  final AppBarParams appBarParams;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title(context),
      backgroundColor: appBarParams.backgroundColor ?? context.colorScheme.surface,
      leading: leadingAppBar(context),
      actions: appBarParams.action,
      centerTitle: appBarParams.centerTitle,
      elevation: appBarParams.elevation,
      shadowColor: appBarParams.shadowColor,
      surfaceTintColor: appBarParams.surfaceTintColor,
      shape: appBarParams.shape,
      bottom: appBarParams.bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget title(BuildContext context) {
    return appBarParams.child ??
        AppText(
          appBarParams.title!,
          style: appBarParams.tittleStyle ??
              context.textTheme.bodyLarge.s19.sb?.copyWith(
                color: appBarParams.textColor,
              ),
        );
  }

  Widget leadingAppBar(BuildContext context) =>
      appBarParams.leading ??
      (appBarParams.hasLeading && Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: appBarParams.iconColor ?? AppColors.grey.shade600,
                size: 20.r,
              ),
              onPressed: appBarParams.onBack ?? () => Navigator.maybePop(context),
              padding: EdgeInsets.zero,
            )
          : const SizedBox());
}
