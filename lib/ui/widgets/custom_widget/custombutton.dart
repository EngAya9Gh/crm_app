import 'package:flutter/material.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed, required this.text, this.width, this.icon});

  VoidCallback? onPressed;
  double? width;
  String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...{
                  AppIcon(icon!, color: Colors.white),
                  SizedBox(width: 10),
                },
                AppText(
                  text!,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
