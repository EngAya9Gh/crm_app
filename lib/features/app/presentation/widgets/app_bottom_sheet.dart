import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/navigator/app_navigator.dart';

class AppBottomSheet<T> extends StatelessWidget {
  const AppBottomSheet._({
    Key? key,
    required this.child,
    required this.showCloseIcon,
    this.onCancelFilter,
  }) : super(key: key);

  final Widget child;
  final bool showCloseIcon;
  final VoidCallback? onCancelFilter;

  static Future<T?> show<T>({
    required BuildContext context,
    required final Widget child,
    final bool? enableDrag,
    final bool? isDismissible,
    final bool? isScrollControlled,
    final Color? backgroundColor,
    final Color? barrierColor,
    final bool showCloseIcon = true,
    final VoidCallback? onCancelFilter,
    final VoidCallback? onDismissed,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      isScrollControlled: isScrollControlled ?? true,
      barrierColor: barrierColor,
      useSafeArea: true,
      showDragHandle: false,
      scrollControlDisabledMaxHeightRatio: 0.9,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        reverseCurve: Curves.easeInOut,
        reverseDuration: const Duration(milliseconds: 300),
      ),
      backgroundColor: backgroundColor ?? context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => AppBottomSheet._(
        showCloseIcon: showCloseIcon,
        child: child,
        onCancelFilter: onCancelFilter,
      ),
    )..whenComplete(onDismissed ?? () {});
  }

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
            20.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: showCloseIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  if (showCloseIcon)
                    InkWell(
                      onTap: () {
                        onCancelFilter?.call();
                        AppNavigator.pop();
                      },
                      child: AppIcon(Icons.close, color: Colors.grey),
                    ),
                  Container(
                    width: 100.scaleWidth,
                    height: 6.scaleHeight,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(100),
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
