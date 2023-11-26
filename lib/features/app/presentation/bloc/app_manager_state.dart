part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState({
    required this.lightThemeData,
    required this.darkThemeData,
    this.updateState = const PageState.init(),
    this.hasUpdate,
    this.isUpdateMandatory,
  });

  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final PageState<List<UpdateConfig>> updateState;
  final bool? hasUpdate;
  final bool? isUpdateMandatory;

  AppManagerState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    PageState<List<UpdateConfig>>? updateState,
    final bool? hasUpdate,
    final bool? isUpdateMandatory,
  }) {
    return AppManagerState(
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
      updateState: updateState ?? this.updateState,
      isUpdateMandatory: isUpdateMandatory ?? this.isUpdateMandatory,
      hasUpdate: hasUpdate ?? this.hasUpdate,
    );
  }
}
