import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTicketDetailsActionButton extends StatelessWidget {
  const CustomTicketDetailsActionButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isExpanded = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final Widget widget = ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.primaryMain),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.white,
                fontSize: 13.sp,
              ),
        ));
    return isExpanded
        ? Expanded(child: widget)
        : SizedBox(
            width: MediaQuery.of(context).size.width * 0.31,
            child: widget,
          );
  }
}
