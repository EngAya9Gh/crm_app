import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';

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
        return AppElevatedButton(
          text: value,
          width: width,
          backgroundColor: selected ? kMainColor : Colors.white,
          textStyle: context.textTheme.titleSmall?.copyWith(
            color: selected ? Colors.white : Colors.black,
            fontSize: 12.sp,
          ),
        );
      },
      options: GroupButtonOptions(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
