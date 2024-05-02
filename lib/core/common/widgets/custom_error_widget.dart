import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    this.onPressed,
    this.color,
    this.message,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
      ),
    );
  }
}
