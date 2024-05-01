import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key? key,
    this.bold,
    this.isCentered = true,
  }) : super(key: key);

  final double? bold;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final Widget child = CircularProgressIndicator(strokeWidth: bold ?? 4);
    return isCentered ? Center(child: child) : child;
  }
}
