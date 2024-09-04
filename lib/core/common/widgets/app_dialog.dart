import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    required this.children,
  });

  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      title: title?.isNotEmpty == true
          ? Center(
              child: AppText(
                title ?? '',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      children: children,
    );
  }
}
