part of 'clients_install_reports_cubit.dart';

class ClientsInstallReportsState extends Equatable {
  final BlocStatus<bool> getClientsInstallReportsStatus;

  ClientsInstallReportsState({
    this.getClientsInstallReportsStatus = const BlocStatus<bool>.initial(),
  });

  ClientsInstallReportsState copyWith({
    BlocStatus<bool>? getClientsInstallReportsStatus,
  }) {
    return ClientsInstallReportsState(
      getClientsInstallReportsStatus:
          getClientsInstallReportsStatus ?? this.getClientsInstallReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsInstallReportsStatus,
    ];
  }
}
