part of 'manage_withdrawn_invoices_cubit.dart';

class ManageWithdrawnInvoicesState extends Equatable {
  final BlocStatus getManageWithdrawnInvoicesStatus;

  ManageWithdrawnInvoicesState({
    this.getManageWithdrawnInvoicesStatus = const BlocStatus.initial(),
  });

  ManageWithdrawnInvoicesState copyWith({
    BlocStatus<bool>? getWithdrawnInvoicesStatus,
  }) {
    return ManageWithdrawnInvoicesState(
      getManageWithdrawnInvoicesStatus:
          getWithdrawnInvoicesStatus ?? this.getManageWithdrawnInvoicesStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getManageWithdrawnInvoicesStatus,
    ];
  }
}
