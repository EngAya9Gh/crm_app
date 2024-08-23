import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.onPressed,
    this.color,
    this.message,
    this.isCentered = true,
    this.isExpanded = false,
  });

  final VoidCallback? onPressed;
  final Color? color;
  final String? message;
  final bool isCentered;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (message != null) ...[
          AppText(message!),
        ],
        if (onPressed != null) ...[
          IconButton(
            color: color,
            onPressed: onPressed,
            icon: Icon(
              Icons.refresh,
              size: (25.0).scaleIconsSize,
            ),
          ),
        ],
      ],
    );
    if (isCentered) child = Center(child: child);
    return isExpanded ? Expanded(child: child) : child;
  }
}
