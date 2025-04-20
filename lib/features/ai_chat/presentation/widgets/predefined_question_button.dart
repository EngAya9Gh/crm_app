import 'package:flutter/material.dart';

import '../../domain/models/chat_message_model.dart';
import '../../../../core/utils/app_colors.dart';

class PredefinedQuestionButton extends StatelessWidget {
  final PredefinedQuestion question;
  final VoidCallback onTap;

  const PredefinedQuestionButton({
    Key? key,
    required this.question,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryMain.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryMain.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              question.icon,
              size: 16,
              color: AppColors.primaryMain,
            ),
            const SizedBox(width: 6),
            Text(
              question.question,
              style: TextStyle(
                color: AppColors.primaryMain,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
