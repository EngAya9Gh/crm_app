part of 'smart_crm_appbar.dart';

class AppBarParams {
  AppBarParams({
    this.textColor,
    this.translateTitle = true,
    this.centerTitle = true,
    this.hasLeading = true,
    this.dividerBottom = false,
    this.child,
    this.title,
    this.iconColor,
    this.action,
    this.elevation = 0,
    this.shadowColor,
    this.surfaceTintColor,
    this.backgroundColor,
    this.onBack,
    this.tittleStyle,
    this.shape,
    this.colorStatusBar,
    this.leading,
    this.bottom,
  });

  final String? title;
  final Widget? child;
  final Widget? leading;
  final List<Widget>? action;
  final bool translateTitle;
  final double? elevation;
  final Color? shadowColor, textColor, iconColor;
  final Color? surfaceTintColor;
  final Color? backgroundColor;
  final bool centerTitle;
  final VoidCallback? onBack;
  final bool hasLeading;
  final TextStyle? tittleStyle;
  final bool dividerBottom;
  final ShapeBorder? shape;
  final Color? colorStatusBar;
  final PreferredSizeWidget? bottom;

  @override
  String toString() {
    return 'AppBarParams{title: $title, action: $action, translateTitle: $translateTitle}';
  }
}
