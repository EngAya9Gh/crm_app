part of 'support_tab_cubit.dart';

@immutable
sealed class SupportTabState {}

final class SupportTabInitial extends SupportTabState {}

final class SupportTabLoading extends SupportTabState {}

final class SupportTabLoaded extends SupportTabState {}

final class SupportTabError extends SupportTabState {
  final String message;

  SupportTabError(this.message);
}
