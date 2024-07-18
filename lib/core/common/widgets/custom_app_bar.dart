import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    title: Text(title),
    titleTextStyle: context.textTheme.titleMedium?.copyWith(
      color: Colors.white,
    ),
    centerTitle: true,
  );
}
