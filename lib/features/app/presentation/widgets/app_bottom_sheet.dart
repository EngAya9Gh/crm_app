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
        backgroundColor: backgroundColor ?? context.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20).r)),
        builder: (_) => AppBottomSheet._(showCloseIcon: showCloseIcon, child: child),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Padding(
              padding: HWEdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: showCloseIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  if (showCloseIcon)
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: Colors.grey),
                    ),
                  Container(
                    width: 90.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(90).r,
                    ),
                  ),
                  if (showCloseIcon) const SizedBox.shrink(),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
