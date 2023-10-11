import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_padding.dart';

class AppBottomSheet<T> extends StatelessWidget {
  const AppBottomSheet._({
    Key? key,
    required this.child,
    required this.showCloseIcon,
  }) : super(key: key);

  final Widget child;
  final bool showCloseIcon;

  static Future<T?> show<T>({
    required BuildContext context,
    required final Widget child,
    final bool? enableDrag,
    final bool? isDismissible,
    final bool? isScrollControlled,
    final Color? backgroundColor,
    final Color? barrierColor,
    final bool showCloseIcon = true,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        enableDrag: enableDrag ?? true,
        isDismissible: isDismissible ?? true,
        isScrollControlled: isScrollControlled ?? true,
        barrierColor: barrierColor,
        backgroundColor: backgroundColor ?? context.colorScheme.onTertiary,
        builder: (_) => AppBottomSheet._(showCloseIcon: showCloseIcon, child: child),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 20.verticalSpace,
        Padding(
          padding: EdgeInsets.all(10),
          // HWEdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: showCloseIcon ?
            MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              if (showCloseIcon) const SizedBox.shrink(),
              Container(
                width: 90 ,
                height: 5 ,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(90) ,
                ),
              ),
              if (showCloseIcon)
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: context.colorScheme.error),
                ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
