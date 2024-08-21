import 'package:flutter/material.dart';

class AppCardContainer extends StatelessWidget {
  const AppCardContainer({
    super.key,
    this.onTap,
    required this.child,
    this.padding,
  });

  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        shadowColor: Colors.grey.withOpacity(0.5),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: child,
        ),
      ),
    );
  }
}
