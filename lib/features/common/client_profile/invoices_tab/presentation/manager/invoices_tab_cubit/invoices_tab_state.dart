part of 'invoices_tab_cubit.dart';

class InvoicesTabState extends Equatable {
  final StateStatus getInvoicesStatus;
  final String getInvoicesMessage;

  const InvoicesTabState({
    this.getInvoicesStatus = StateStatus.initial,
    this.getInvoicesMessage = '',
  });

  InvoicesTabState copyWith({
    StateStatus? getInvoicesStatus,
    String? getInvoicesMessage,
  }) {
    return InvoicesTabState(
      getInvoicesStatus: getInvoicesStatus ?? this.getInvoicesStatus,
      getInvoicesMessage: getInvoicesMessage ?? this.getInvoicesMessage,
    );
  }

  @override
  List<Object> get props => [
        getInvoicesStatus,
        getInvoicesMessage,
      ];
}
