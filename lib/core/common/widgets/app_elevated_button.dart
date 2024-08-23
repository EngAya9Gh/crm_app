import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../config/theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/extensions/build_context.dart';
import '../../utils/extensions/num.dart';
import '../../utils/theme_state.dart';
import 'app_loader.dart';

enum AppButtonStyle {
  primary,
  secondary,
}

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.onDisabled,
    this.child,
    this.text,
    this.isLoading = false,
    this.sensitiveNetwork = false,
    this.appButtonStyle,
    this.textStyle,
    this.style,
    this.isDisabled,
    this.backgroundColor,
    this.textColor,
    this.width,
  });

  final Function()? onPressed;
  final Function()? onDisabled;
  final Widget? child;
  final String? text;
  final bool isLoading;
  final AppButtonStyle? appButtonStyle;
  final ButtonStyle? style;
  final bool sensitiveNetwork;
  final TextStyle? textStyle;
  final bool? isDisabled;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends ThemeState<AppElevatedButton> {
  ElevatedButtonThemeData? _buttonTheme;

  bool get absorbing => widget.onDisabled != null ? false : widget.isLoading;

  CrossFadeState get crossFadeState =>
      widget.isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst;

  Function()? get onTap =>
      widget.isLoading ? widget.onDisabled?.call() ?? () {} : widget.onPressed;

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (widget.text == null && widget.child == null) {
        throw FlutterError("Can't be both text and child is null");
      }
      if (widget.style != null && widget.appButtonStyle != null) {
        throw FlutterError("Can't be pass both style and tripperButtonStyle");
      }
      return true;
    }());

    setButtonStyle();

    ButtonStyle? finalTheme = (widget.style ?? _buttonTheme?.style);
    if (widget.isDisabled == true) {
      finalTheme = finalTheme?.copyWith(
        backgroundColor: MaterialStateProperty.all(Colors.grey),
      );
    }

    if (!widget.isLoading) {
      finalTheme = finalTheme?.copyWith(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      );
    }
    if (widget.backgroundColor != null) {
      finalTheme = finalTheme?.copyWith(
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
      );
    }
    if (widget.textColor != null) {
      finalTheme = finalTheme?.copyWith(
        foregroundColor: MaterialStateProperty.all(widget.textColor),
      );
    }

    final child = ElevatedButton(
      onPressed: widget.isDisabled != true ? onTap : null,
      style: widget.isDisabled != true
          ? finalTheme
          : finalTheme?.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.grey)),
      child: AnimatedCrossFade(
        firstChild: firstChild,
        secondChild: secondChild,
        duration: 300.milliseconds,
        crossFadeState: crossFadeState,
      ),
    );

    return widget.width != null
        ? SizedBox(width: widget.width, child: child)
        : child;
  }

  Widget get secondChild => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText("loading..."),
            if (widget.isLoading) ...{
              8.horizontalSpace,
              const AppLoader(),
              4.horizontalSpace,
            },
          ],
        ),
      );

  Widget get firstChild {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: widget.child ??
            AppText(
              widget.text!,
              fontSize: 18,
              color: widget.isDisabled == true
                  ? Colors.grey.shade700
                  : widget.textColor ?? Colors.white,
            ),
      ),
    );
  }

  void setButtonStyle() {
    final defaultElevatedTheme = theme.elevatedButtonTheme;

    final secondaryElevatedTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: defaultElevatedTheme.style?.shape?.resolve({}),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shadowColor: colorScheme.white.withOpacity(0.1),
          textStyle: widget.textStyle,
          side: BorderSide(
            color: widget.isDisabled == true
                ? Colors.grey
                : context.colorScheme.primary,
            width: 0.7,
          )),
    );

    final loadingElevatedTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: defaultElevatedTheme.style?.shape?.resolve({}),
        backgroundColor: colorScheme.surfaceVariant,
        // foregroundColor: colorScheme.outline,
        textStyle: widget.textStyle?.copyWith(color: Colors.white),
      ),
    );

    _buttonTheme = widget.isLoading
        ? loadingElevatedTheme
        : (widget.appButtonStyle == AppButtonStyle.secondary
            ? secondaryElevatedTheme
            : defaultElevatedTheme);
  }
}
