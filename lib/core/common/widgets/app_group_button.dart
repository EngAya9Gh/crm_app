import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../utils/app_colors.dart';
import 'app_elevated_button.dart';

class AppGroupButton extends StatelessWidget {
  const AppGroupButton({
    super.key,
    required this.groupButtonController,
    required this.buttons,
    required this.onSelected,
    this.width,
  });

  final GroupButtonController groupButtonController;
  final List<String> buttons;
  final dynamic Function(String, int, bool)? onSelected;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GroupButton(
      controller: groupButtonController,
      buttons: buttons,
      onSelected: onSelected,
      buttonBuilder: (selected, value, context) {
        return AbsorbPointer(
          absorbing: true,
          child: AppElevatedButton(
            text: value,
            width: width,
            backgroundColor: selected ? AppColors.primaryColor : Colors.white,
            textColor: selected ? Colors.white : Colors.black,
            onPressed: () =>
                groupButtonController.selectIndex(buttons.indexOf(value)),
          ),
        );
      },
      options: GroupButtonOptions(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
