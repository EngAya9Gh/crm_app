part of 'clients_debts_reports_cubit.dart';

class ClientsDebtsReportsState extends Equatable {
  final BlocStatus<bool> getClientsDebtsReportsStatus;

  ClientsDebtsReportsState({
    this.getClientsDebtsReportsStatus = const BlocStatus<bool>.initial(),
  });

  ClientsDebtsReportsState copyWith({
    BlocStatus<bool>? getClientsDebtsReportsStatus,
  }) {
    return ClientsDebtsReportsState(
      getClientsDebtsReportsStatus:
          getClientsDebtsReportsStatus ?? this.getClientsDebtsReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsDebtsReportsStatus,
    ];
  }
}
