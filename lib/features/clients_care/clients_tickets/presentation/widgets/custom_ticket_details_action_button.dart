import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
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
    final Widget widget = AppElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          backgroundColor: WidgetStateProperty.all(AppColors.primaryMain),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        text: text,
       );
    return isExpanded
        ? Expanded(child: widget)
        : SizedBox(
            width: MediaQuery.of(context).size.width * 0.31,
            child: widget,
          );
  }
}
