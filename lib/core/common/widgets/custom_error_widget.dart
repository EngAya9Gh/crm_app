import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
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
          Text(message!),
        ],
        if (onPressed != null) ...[
          IconButton(
            color: color,
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ],
    );
    if (isCentered) child = Center(child: child);
    return isExpanded ? Expanded(child: child) : child;
  }
}
