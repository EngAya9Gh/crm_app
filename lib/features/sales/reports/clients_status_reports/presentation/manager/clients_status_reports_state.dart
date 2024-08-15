part of 'clients_status_reports_cubit.dart';

class ClientsStatusReportsState extends Equatable {
  final BlocStatus<bool> getClientsStatusReportsStatus;

  ClientsStatusReportsState({
    this.getClientsStatusReportsStatus = const BlocStatus<bool>.initial(),
  });

  ClientsStatusReportsState copyWith({
    BlocStatus<bool>? getClientsStatusReportsStatus,
  }) {
    return ClientsStatusReportsState(
      getClientsStatusReportsStatus:
          getClientsStatusReportsStatus ?? this.getClientsStatusReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsStatusReportsStatus,
    ];
  }
}
