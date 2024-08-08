part of 'support_clients_invoices_cubit.dart';

class SupportClientsInvoicesState extends Equatable {
  final BlocStatus getSupportClientInvoicesStatus;

  SupportClientsInvoicesState({
    this.getSupportClientInvoicesStatus = const BlocStatus.initial(),
  });

  SupportClientsInvoicesState copyWith({
    BlocStatus? getSupportClientInvoicesStatus,
    BlocStatus? locallyFilterDelayInstallReportsStatus,
  }) {
    return SupportClientsInvoicesState(
      getSupportClientInvoicesStatus:
          getSupportClientInvoicesStatus ?? this.getSupportClientInvoicesStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getSupportClientInvoicesStatus,
    ];
  }
}
