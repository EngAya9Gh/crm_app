import 'package:flutter/material.dart';

import '../../utils/extensions/build_context.dart';

AppBar CustomAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(title),
    titleTextStyle: context.textTheme.titleMedium?.copyWith(
      color: Colors.white,
    ),
    centerTitle: true,
    actions: actions,
  );
}
