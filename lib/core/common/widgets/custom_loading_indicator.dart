import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key? key,
    this.size,
    this.isCentered = true,
  }) : super(key: key);

  final double? size;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final Widget child = CircularProgressIndicator(strokeWidth: size ?? 4);
    return isCentered ? Center(child: child) : child;
  }
}
