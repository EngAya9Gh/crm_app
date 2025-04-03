import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';

class AddActionButton extends StatelessWidget {
  const AddActionButton({
    Key? key,
    required this.onTap,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.text = 'Add Action',
  }) : super(key: key);

  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color textColor;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryMain,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: iconColor, size: 20),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
