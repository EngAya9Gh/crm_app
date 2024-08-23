part of 'theme.dart';

class AppTheme {
  static var sysBrightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static ThemeData getAppTheme(BuildContext context) {
    return AppTheme._light(context);
    return sysBrightness == Brightness.light
        ? AppTheme._light(context)
        : AppTheme._dark(context);
  }

  static ThemeData get _builtInLightTheme => ThemeData.light();

  static ThemeData get _builtInDarkTheme => ThemeData.dark();

  static ThemeData _light(BuildContext context) {
    final textTheme = appTextTheme(
      context,
      _builtInLightTheme.textTheme,
      _lightColorScheme.onSurface,
    );

    return _builtInLightTheme.copyWith(
        colorScheme: _lightColorScheme.copyWith(
          secondary: Colors.blueGrey,
          surface: Colors.grey[200]!,
        ),
        textTheme: textTheme,
        typography: Typography.material2021(),
        elevatedButtonTheme: _elevatedButtonTheme(_lightColorScheme, textTheme),
        textButtonTheme: _textButtonTheme(_lightColorScheme, textTheme),
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: _appBarTheme(
            _builtInLightTheme, _lightColorScheme, textTheme, ThemeMode.light),
        dividerTheme: _dividerTheme(_builtInLightTheme, _lightColorScheme),
        primaryColor: _lightColorScheme.primary,
        bottomSheetTheme: _bottomSheetThemeData(_builtInLightTheme),
        navigationBarTheme: _bottomNavigationBarThemeData(_builtInLightTheme),
        cardColor: Colors.white,
        dialogBackgroundColor: Colors.grey[100]);
  }

  static ThemeData _dark(BuildContext context) {
    final textTheme = appTextTheme(
      context,
      _builtInDarkTheme.textTheme,
      _darkColorScheme.onSurface,
    );

    return _builtInDarkTheme.copyWith(
        colorScheme: _darkColorScheme.copyWith(
          secondary: Colors.teal,
          surface: Colors.grey[800]!,
        ),
        textTheme: textTheme,
        typography: Typography.material2018(),
        elevatedButtonTheme: _elevatedButtonTheme(_darkColorScheme, textTheme),
        textButtonTheme: _textButtonTheme(_darkColorScheme, textTheme),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: _appBarTheme(
            _builtInDarkTheme, _darkColorScheme, textTheme, ThemeMode.dark),
        dividerTheme: _dividerTheme(_builtInDarkTheme, _darkColorScheme),
        primaryColor: _darkColorScheme.primary,
        bottomSheetTheme: _bottomSheetThemeData(_builtInDarkTheme),
        navigationBarTheme: _bottomNavigationBarThemeData(_builtInDarkTheme),
        cardColor: Colors.grey[850],
        dialogBackgroundColor: Colors.grey[850]);
  }

  static AppBarTheme _appBarTheme(ThemeData theme, ColorScheme scheme,
      TextTheme textTheme, ThemeMode themeMode) {
    return theme.appBarTheme.copyWith(
      backgroundColor: scheme.primary,
      titleTextStyle: textTheme.headlineSmall,
      systemOverlayStyle: themeMode == ThemeMode.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      elevation: 0.0,
      surfaceTintColor: scheme.surface,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(
      ColorScheme scheme, TextTheme textTheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.labelLarge?.sb,
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        disabledBackgroundColor: scheme.grey50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kbrBorderTextField),
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(
      ColorScheme scheme, TextTheme textTheme) {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.labelLarge,
        foregroundColor: AppColors.grey.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kbrBorderTextField),
        ),
        shadowColor: scheme.primary.withOpacity(0.2),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetThemeData(ThemeData theme) =>
      theme.bottomSheetTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
        ),
        backgroundColor: theme.colorScheme.surface,
      );

  static DividerThemeData _dividerTheme(ThemeData theme, ColorScheme scheme) =>
      theme.dividerTheme
          .copyWith(color: AppColors.grey.withOpacity(0.2), thickness: 1);

  static NavigationBarThemeData _bottomNavigationBarThemeData(ThemeData theme) {
    return theme.navigationBarTheme.copyWith(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      iconTheme:
          const WidgetStatePropertyAll(IconThemeData(color: AppColors.grey)),
      backgroundColor: Colors.white,
    );
  }
}
