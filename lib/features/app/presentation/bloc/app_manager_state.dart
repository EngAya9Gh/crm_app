part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState({
    required this.lightThemeData,
    required this.darkThemeData,
    this.updateState = const PageState.init(),
  });

  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final PageState<List<UpdateConfig>> updateState;

  AppManagerState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    PageState<List<UpdateConfig>>? updateState,
  }) {
    return AppManagerState(
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
      updateState: updateState ?? this.updateState,
    );
  }
}
