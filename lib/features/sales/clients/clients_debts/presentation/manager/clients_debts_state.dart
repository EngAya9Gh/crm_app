part of 'clients_debts_cubit.dart';

class ClientsDebtsState extends Equatable {
  final BlocStatus<bool> getPendingInvoicesStatus;
  final BlocStatus filterPendingInvoicesStatus;

  ClientsDebtsState({
    this.getPendingInvoicesStatus = const BlocStatus<bool>.initial(),
    this.filterPendingInvoicesStatus = const BlocStatus<bool>.initial(),
  });

  ClientsDebtsState copyWith({
    BlocStatus<bool>? getPendingInvoicesStatus,
    BlocStatus? filterPendingInvoicesStatus,
  }) {
    return ClientsDebtsState(
      getPendingInvoicesStatus:
          getPendingInvoicesStatus ?? this.getPendingInvoicesStatus,
      filterPendingInvoicesStatus:
          filterPendingInvoicesStatus ?? this.filterPendingInvoicesStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getPendingInvoicesStatus,
      filterPendingInvoicesStatus,
    ];
  }
}
