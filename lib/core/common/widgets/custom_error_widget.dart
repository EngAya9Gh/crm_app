import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        color: color,
        onPressed: onPressed,
        icon: Icon(Icons.refresh),
      ),
    );
  }
}
