part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState({
    required this.lightThemeData,
    required this.darkThemeData,
    this.updateState = const PageState.init(),
    this.hasUpdate,
    this.isUpdateMandatory,
    this.checkRedirectionsState = const PageState.init(),
  });

  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final PageState<List<UpdateConfig>> updateState;
  final bool? hasUpdate;
  final bool? isUpdateMandatory;
  final PageState<dynamic> checkRedirectionsState;

  AppManagerState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    PageState<List<UpdateConfig>>? updateState,
    final bool? hasUpdate,
    final bool? isUpdateMandatory,
    final PageState<dynamic>? checkRedirectionsState,
  }) {
    return AppManagerState(
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
      updateState: updateState ?? this.updateState,
      isUpdateMandatory: isUpdateMandatory ?? this.isUpdateMandatory,
      hasUpdate: hasUpdate ?? this.hasUpdate,
      checkRedirectionsState:
          checkRedirectionsState ?? this.checkRedirectionsState,
    );
  }
}
