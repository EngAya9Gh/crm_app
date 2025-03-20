import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.headerWidget,
    this.insetPadding,
    this.contentPadding,
    required this.children,
  });

  final String? title;
  final Widget? headerWidget;
  final List<Widget> children;
  final EdgeInsets? insetPadding;
  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: insetPadding,
      contentPadding:contentPadding?? const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      title: headerWidget ??
          (title?.isNotEmpty == true
              ? Center(
                  child: AppText(
                    title ?? '',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null),
      children: children,
    );
  }
}
