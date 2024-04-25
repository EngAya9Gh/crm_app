part of 'invoices_tab_cubit.dart';

@immutable
sealed class InvoicesTabState {}

final class InvoicesTabInitial extends InvoicesTabState {}

final class InvoicesTabLoading extends InvoicesTabState {}

final class InvoicesTabLoaded extends InvoicesTabState {}

class InvoicesTabError extends InvoicesTabState {
  final String message;

  InvoicesTabError(this.message);
}
