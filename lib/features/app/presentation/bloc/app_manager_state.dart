part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState({
    required this.lightThemeData,
    required this.darkThemeData,
  });

  final ThemeData lightThemeData;
  final ThemeData darkThemeData;

  AppManagerState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
  }) {
    return AppManagerState(
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
    );
  }
}
