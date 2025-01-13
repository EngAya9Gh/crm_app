part of 'theme.dart';

class AppTheme {
  static var sysBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static ThemeData getAppTheme(BuildContext context) {
    return AppTheme._light(context);
    return sysBrightness == Brightness.light ? AppTheme._light(context) : AppTheme._dark(context);
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
        primaryColor: AppColors.primaryMain,
        // scaffoldBackgroundColor: AppColors.bodyBackground,
        colorScheme: _lightColorScheme.copyWith(
          primary: AppColors.primaryMain,
          secondary: AppColors.secondaryMain,
          error: AppColors.statusErrorActive,
          // surface: AppColors.bodyBackground,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryMain,
          disabledColor: AppColors.textPrimary,
        ),
        textTheme: textTheme,
        datePickerTheme: DatePickerThemeData(
            inputDecorationTheme: InputDecorationTheme(
                counterStyle: TextStyle(fontSize: 12),
                errorStyle: TextStyle(fontSize: 12),
                floatingLabelStyle: TextStyle(fontSize: 12),
                helperStyle: TextStyle(fontSize: 12),
                hintStyle: TextStyle(fontSize: 12),
                labelStyle: TextStyle(fontSize: 12),
                prefixStyle: TextStyle(fontSize: 12),
                suffixStyle: TextStyle(fontSize: 12)),
            dayStyle: TextStyle(fontSize: 12),
            yearStyle: TextStyle(fontSize: 12),
            headerHeadlineStyle: TextStyle(fontSize: 12),
            headerHelpStyle: TextStyle(fontSize: 12),
            weekdayStyle: TextStyle(fontSize: 12),
            rangePickerHeaderHeadlineStyle: TextStyle(fontSize: 12),
            rangePickerHeaderHelpStyle: TextStyle(fontSize: 12),
            cancelButtonStyle: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12))),
            confirmButtonStyle: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12)))),
        typography: Typography.material2021(),
        elevatedButtonTheme: _elevatedButtonTheme(_lightColorScheme, textTheme),
        textButtonTheme: _textButtonTheme(_lightColorScheme, textTheme),
        appBarTheme: _appBarTheme(_builtInLightTheme, _lightColorScheme, textTheme, ThemeMode.light),
        dividerTheme: _dividerTheme(_builtInLightTheme, _lightColorScheme),
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
        primaryColor: AppColors.primaryAltDark,
        scaffoldBackgroundColor: AppColors.snackbarBackground,
        colorScheme: _darkColorScheme.copyWith(
          primary: AppColors.primaryAltDark,
          secondary: AppColors.secondaryAltDark,
          error: AppColors.statusErrorActive,
          surface: AppColors.snackbarBackground,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryAltDark,
          disabledColor: AppColors.textPrimary,
        ),
        textTheme: textTheme,
        datePickerTheme: DatePickerThemeData(
            inputDecorationTheme: InputDecorationTheme(
                counterStyle: TextStyle(fontSize: 12),
                errorStyle: TextStyle(fontSize: 12),
                floatingLabelStyle: TextStyle(fontSize: 12),
                helperStyle: TextStyle(fontSize: 12),
                hintStyle: TextStyle(fontSize: 12),
                labelStyle: TextStyle(fontSize: 12),
                prefixStyle: TextStyle(fontSize: 12),
                suffixStyle: TextStyle(fontSize: 12)),
            dayStyle: TextStyle(fontSize: 12),
            yearStyle: TextStyle(fontSize: 12),
            headerHeadlineStyle: TextStyle(fontSize: 12),
            headerHelpStyle: TextStyle(fontSize: 12),
            weekdayStyle: TextStyle(fontSize: 12),
            rangePickerHeaderHeadlineStyle: TextStyle(fontSize: 12),
            rangePickerHeaderHelpStyle: TextStyle(fontSize: 12),
            cancelButtonStyle: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12))),
            confirmButtonStyle: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12)))),
        typography: Typography.material2018(),
        elevatedButtonTheme: _elevatedButtonTheme(_darkColorScheme, textTheme),
        textButtonTheme: _textButtonTheme(_darkColorScheme, textTheme),
        appBarTheme: _appBarTheme(_builtInDarkTheme, _darkColorScheme, textTheme, ThemeMode.dark),
        dividerTheme: _dividerTheme(_builtInDarkTheme, _darkColorScheme),
        bottomSheetTheme: _bottomSheetThemeData(_builtInDarkTheme),
        navigationBarTheme: _bottomNavigationBarThemeData(_builtInDarkTheme),
        cardColor: Colors.grey[850],
        dialogBackgroundColor: Colors.grey[850]);
  }

  static AppBarTheme _appBarTheme(ThemeData theme, ColorScheme scheme, TextTheme textTheme, ThemeMode themeMode) {
    return theme.appBarTheme.copyWith(
      backgroundColor: scheme.primary,
      titleTextStyle: textTheme.headlineSmall,
      systemOverlayStyle: themeMode == ThemeMode.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      elevation: 0.0,
      surfaceTintColor: scheme.surface,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme scheme, TextTheme textTheme) {
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

  static TextButtonThemeData _textButtonTheme(ColorScheme scheme, TextTheme textTheme) {
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

  static BottomSheetThemeData _bottomSheetThemeData(ThemeData theme) => theme.bottomSheetTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
        ),
        backgroundColor: theme.colorScheme.surface,
      );

  static DividerThemeData _dividerTheme(ThemeData theme, ColorScheme scheme) =>
      theme.dividerTheme.copyWith(color: AppColors.grey.withOpacity(0.2), thickness: 1);

  static NavigationBarThemeData _bottomNavigationBarThemeData(ThemeData theme) {
    return theme.navigationBarTheme.copyWith(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      iconTheme: const WidgetStatePropertyAll(IconThemeData(color: AppColors.grey)),
      backgroundColor: Colors.white,
    );
  }
}
