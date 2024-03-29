import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomTicketDetailsActionButton extends StatelessWidget {
  const CustomTicketDetailsActionButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kMainColor),
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
