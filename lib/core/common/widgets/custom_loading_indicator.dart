import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key, this.size}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: size ?? 4,
      ),
    );
  }
}
