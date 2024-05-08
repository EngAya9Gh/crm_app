import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key? key,
    this.bold,
    this.padding = 2,
    this.isCentered = true,
  }) : super(key: key);

  final double? bold;
  final double padding;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final Widget child = Padding(
      padding: EdgeInsets.all(padding),
      child: CircularProgressIndicator(strokeWidth: bold ?? 4),
    );
    return isCentered ? Center(child: child) : child;
  }
}
