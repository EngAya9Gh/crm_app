import 'dart:ui';

import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';

class AnimatedDialog extends StatelessWidget {
  const AnimatedDialog._({
    super.key,
    required this.child,
    this.backgroundColor,
    this.elevation,
    required this.insetAnimationDuration,
    required this.insetAnimationCurve,
    this.insetPadding,
    required this.clipBehavior,
    this.shape,
    this.alignment,
  });

  final Widget child;
  final Color? backgroundColor;
  final double? elevation;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final EdgeInsets? insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;

  static Future<T?> show<T>({
    required Widget child,
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    bool barrierDismissible = true,
    String barrierLabel = 'Dismiss',
    Color barrierColor = const Color(0x80000000),
    Color? backgroundColor,
    double? elevation,
    Duration insetAnimationDuration = const Duration(milliseconds: 100),
    Curve insetAnimationCurve = Curves.linear,
    EdgeInsets? insetPadding,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
  }) async {
    return await showGeneralDialog<T>(
      context: AppNavigator.navigatorKey.currentContext!,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return AnimatedDialog._(
          backgroundColor: backgroundColor,
          alignment: alignment,
          clipBehavior: clipBehavior,
          elevation: elevation,
          insetAnimationCurve: insetAnimationCurve,
          insetAnimationDuration: insetAnimationDuration,
          insetPadding: insetPadding,
          shape: shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      anchorPoint: anchorPoint,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      routeSettings: routeSettings,
      transitionBuilder: transitionBuilder,
      useRootNavigator: useRootNavigator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: FittedBox(
        child: Dialog(
          backgroundColor: backgroundColor,
          alignment: alignment,
          clipBehavior: clipBehavior,
          elevation: elevation,
          insetAnimationCurve: insetAnimationCurve,
          insetAnimationDuration: insetAnimationDuration,
          insetPadding: insetPadding,
          shape: shape,
          child: child,
        ),
      ),
    );
  }
}
