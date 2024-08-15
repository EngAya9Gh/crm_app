import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(
        color: kWhiteColor,
        fontSize: (22.0).scaleFontSize,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((50.0));
}
