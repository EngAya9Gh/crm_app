import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
  });

  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kMainColor),
      ),
      onPressed: onPress,
      child: Text(text),
    );
  }
}
