part of 'withdrawn_invoices_cubit.dart';

class WithdrawnInvoicesState extends Equatable {
  final BlocStatus getWithdrawnInvoicesStatus;

  WithdrawnInvoicesState({
    this.getWithdrawnInvoicesStatus = const BlocStatus.initial(),
  });

  WithdrawnInvoicesState copyWith({
    BlocStatus<bool>? getWithdrawnInvoicesStatus,
  }) {
    return WithdrawnInvoicesState(
      getWithdrawnInvoicesStatus:
          getWithdrawnInvoicesStatus ?? this.getWithdrawnInvoicesStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getWithdrawnInvoicesStatus,
    ];
  }
}
