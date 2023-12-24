import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';

import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text.dart';

class GroupedButtons<T> extends StatefulWidget {

  GroupedButtons({
    Key? key,
    this.enableDeselect = false,
    this.maxSelected,
    this.buttons = const [],
    this.spacing,
    this.title,
    this.onSelected,
    this.buttonTextBuilder,
    this.selectedIndex,
  }) : super(key: key);

  final List<T> buttons;
  final bool enableDeselect;
  final int? maxSelected;
  final int? selectedIndex;
  final double? spacing;
  final String? title;
  final Function(T value, int index, bool isSelected)? onSelected;
  final GroupbuttonTextBuilder<T>? buttonTextBuilder;

  @override
  State<GroupedButtons<T>> createState() => _GroupedButtonsState<T>();
}

class _GroupedButtonsState<T> extends State<GroupedButtons<T>> {
  late final GroupButtonController controller;

  @override
  void initState() {
    controller = GroupButtonController(selectedIndex: widget.selectedIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...{
          AppText(widget.title!, style: context.textTheme.titleMedium?.s15.sb),
          10.verticalSpace,
        },
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: HWEdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10).r,
              boxShadow: [
                BoxShadow(color: AppColors.grey.shade100.withAlpha(100), spreadRadius: 5, blurRadius: 10),
              ],
            ),
            child: GroupButton<T>(
              onSelected: widget.onSelected,
              controller: controller,
              buttons: widget.buttons,
              buttonTextBuilder: widget.buttonTextBuilder,
              enableDeselect: widget.enableDeselect,
              maxSelected: widget.maxSelected,
              options: GroupButtonOptions(
                buttonWidth: (MediaQuery.sizeOf(context).width / widget.buttons.length) - 30.w,
                borderRadius: BorderRadius.circular(10).r,
                spacing: widget.spacing ?? 10.w,
                selectedShadow: [
                  BoxShadow(color: context.colorScheme.primary.withAlpha(20), spreadRadius: 5, blurRadius: 10),
                ],
                unselectedTextStyle: context.textTheme.bodyMedium,
                selectedTextStyle: context.textTheme.bodyLarge.sb.withColor(context.colorScheme.primary),
                buttonHeight: 40.r,
                selectedBorderColor: context.colorScheme.primary,
                selectedColor: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
