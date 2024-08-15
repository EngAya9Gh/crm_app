part of 'clients_debts_cubit.dart';

class ClientsDebtsState extends Equatable {
  final BlocStatus<bool> getClientsDebtsStatus;
  final BlocStatus filterClientsDebtsStatus;

  ClientsDebtsState({
    this.getClientsDebtsStatus = const BlocStatus<bool>.initial(),
    this.filterClientsDebtsStatus = const BlocStatus<bool>.initial(),
  });

  ClientsDebtsState copyWith({
    BlocStatus<bool>? getClientsDebtsStatus,
    BlocStatus? filterClientsDebtsStatus,
  }) {
    return ClientsDebtsState(
      getClientsDebtsStatus:
          getClientsDebtsStatus ?? this.getClientsDebtsStatus,
      filterClientsDebtsStatus:
          filterClientsDebtsStatus ?? this.filterClientsDebtsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsDebtsStatus,
      filterClientsDebtsStatus,
    ];
  }
}
