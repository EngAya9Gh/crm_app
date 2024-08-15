part of 'support_clients_invoices_cubit.dart';

class SupportClientsInvoicesState extends Equatable {
  final BlocStatus getSupportClientInvoicesStatus;
  final BlocStatus getCitiesFromRegions;

  SupportClientsInvoicesState({
    this.getSupportClientInvoicesStatus = const BlocStatus.initial(),
    this.getCitiesFromRegions = const BlocStatus.initial(),
  });

  SupportClientsInvoicesState copyWith({
    BlocStatus? getSupportClientInvoicesStatus,
    BlocStatus? getCitiesFromRegions,
  }) {
    return SupportClientsInvoicesState(
      getSupportClientInvoicesStatus:
          getSupportClientInvoicesStatus ?? this.getSupportClientInvoicesStatus,
      getCitiesFromRegions: getCitiesFromRegions ?? this.getCitiesFromRegions,
    );
  }

  @override
  List<Object> get props {
    return [
      getSupportClientInvoicesStatus,
      getCitiesFromRegions,
    ];
  }
}
