import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_loader.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/theme_state.dart';
import 'app_text.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    super.key,
    this.onPressed,
    this.onDisabled,
    this.child,
    this.text,
    this.style,
    this.isLoading = false,
    this.appButtonStyle,
    this.textStyle,
    this.fontSize,
  });

  final Function()? onPressed;
  final Function()? onDisabled;
  final Widget? child;
  final String? text;
  final bool isLoading;
  final AppButtonStyle? appButtonStyle;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final double? fontSize;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends ThemeState<AppTextButton> {
  TextButtonThemeData? _buttonTheme;

  bool get absorbing => widget.onDisabled != null ? false : widget.isLoading;

  CrossFadeState get crossFadeState =>
      widget.isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst;

  Function()? get onTap =>
      widget.isLoading ? widget.onDisabled : widget.onPressed;

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

    return AbsorbPointer(
      absorbing: absorbing,
      child: TextButton(
        onPressed: onTap,
        style: widget.style ??
            _buttonTheme?.style?.copyWith(
              textStyle: WidgetStatePropertyAll(
                widget.textStyle ??
                    AppStyles.textStyle.copyWith(
                      fontSize: widget.fontSize ?? 18.sp,
                      color: AppColors.primaryMain,
                      fontFamily: AppFonts.fontFamily2,
                    ),
              ),
            ),
        child: AnimatedCrossFade(
          firstChild: firstChild,
          secondChild: secondChild,
          duration: Duration(milliseconds: 500),
          crossFadeState: crossFadeState,
        ),
      ),
    );
  }

  Widget get secondChild => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText("Loading..", style: null),
            if (widget.isLoading) ...{
              8.horizontalSpace,
              const AppLoader(),
              4.horizontalSpace,
            },
          ],
        ),
      );

  Widget get firstChild {
    final color =
        widget.onPressed == null ? Colors.grey : AppColors.primaryMain;

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: widget.child ??
          AppText(
            widget.text!,
            style:
                widget.textStyle ?? AppStyles.textStyle.copyWith(color: color),
          ),
    );
  }

  void setButtonStyle() {
    final defaultTextTheme = theme.textButtonTheme;

    final secondaryTextTheme = TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: defaultTextTheme.style?.shape?.resolve({}),
        foregroundColor: widget.textStyle?.color ?? AppColors.primaryMain,
        textStyle: widget.textStyle ??
            AppStyles.textStyle.copyWith(color: AppColors.primaryMain),
      ),
    );

    final loadingTextTheme = TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: defaultTextTheme.style?.shape?.resolve({}),
        foregroundColor: colorScheme.outline,
      ),
    );

    _buttonTheme = widget.isLoading
        ? loadingTextTheme
        : widget.appButtonStyle == AppButtonStyle.secondary
            ? secondaryTextTheme
            : defaultTextTheme;
  }
}
