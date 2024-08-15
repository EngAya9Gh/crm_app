part of 'pending_invoices_cubit.dart';

class PendingInvoicesState extends Equatable {
  final BlocStatus<bool> getPendingInvoicesStatus;
  final BlocStatus filterPendingInvoicesStatus;

  PendingInvoicesState({
    this.getPendingInvoicesStatus = const BlocStatus<bool>.initial(),
    this.filterPendingInvoicesStatus = const BlocStatus<bool>.initial(),
  });

  PendingInvoicesState copyWith({
    BlocStatus<bool>? getPendingInvoicesStatus,
    BlocStatus? filterPendingInvoicesStatus,
  }) {
    return PendingInvoicesState(
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
