part of 'theme.dart';

TextTheme appTextTheme(BuildContext context, TextTheme base, Color textColor) {
  return base
      .copyWith(
    displayLarge: base.displayLarge?.copyWith(
      fontSize: _FontSize.displayLarge,
      letterSpacing: -0.25,
      fontFamily: _FontFamily.regular,
      // height: 64,
    ),
    displayMedium: base.displayMedium?.copyWith(
      fontSize: _FontSize.displayMedium,
      letterSpacing: 0,
      fontFamily: _FontFamily.regular,
      // height: 52,
    ),
    displaySmall: base.displaySmall?.copyWith(
      fontSize: _FontSize.displaySmall,
      letterSpacing: 0,
      fontFamily: _FontFamily.regular,
    ),
    // headlineLarge: base.headlineLarge?.copyWith(
    //   fontSize: _FontSize.headlineLarge,
    //   fontFamily: _FontFamily.regular,
    //   height: 40,
    // ),
    headlineMedium: base.headlineMedium?.copyWith(
      fontSize: _FontSize.headlineMedium,
      fontFamily: _FontFamily.regular,
      letterSpacing: 0,
      // height: 36,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      fontSize: _FontSize.headlineSmall,
      fontFamily: _FontFamily.regular,
      letterSpacing: 0,
      // height: 32,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: _FontSize.titleLarge,
      fontFamily: _FontFamily.regular,
      letterSpacing: 0,
      // height: 28,
    ),
    titleMedium: base.titleMedium?.copyWith(
      fontSize: _FontSize.titleMedium,
      fontFamily: _FontFamily.medium,
      letterSpacing: 0.15,
      // height: 24,
    ),
    titleSmall: base.titleSmall?.copyWith(
      fontSize: _FontSize.titleSmall,
      fontFamily: _FontFamily.medium,
      letterSpacing: 0.1,
      // height: 20,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontSize: _FontSize.bodyLarge,
      letterSpacing: 0.5,
      fontFamily: _FontFamily.regular,
      // height: 24,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontSize: _FontSize.bodyMedium,
      letterSpacing: 0.25,
      fontFamily: _FontFamily.regular,
      // height: 20,
    ),
    bodySmall: base.bodySmall?.copyWith(
      fontSize: _FontSize.bodySmall,
      letterSpacing: 0.4,
      fontFamily: _FontFamily.regular,
      // height: 16,
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontSize: _FontSize.labelLarge,
      // height: 20,
      letterSpacing: 0.1,
      fontFamily: _FontFamily.medium,
    ),
    labelMedium: base.labelMedium?.copyWith(
      fontSize: _FontSize.labelMedium,
      fontFamily: _FontFamily.medium,
      letterSpacing: 0.5,
      // height: 16,
    ),
    labelSmall: base.labelSmall?.copyWith(
      fontSize: _FontSize.labelSmall,
      fontFamily: _FontFamily.medium,
      letterSpacing: 0.5,
      // height: 16,
    ),
  )
      .apply(displayColor: textColor, bodyColor: textColor);
}
