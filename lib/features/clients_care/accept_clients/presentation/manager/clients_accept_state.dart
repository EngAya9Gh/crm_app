part of 'clients_accept_cubit.dart';

class ClientsAcceptState extends Equatable {
  final BlocStatus<bool> getClientsAcceptStatus;

  ClientsAcceptState({
    this.getClientsAcceptStatus = const BlocStatus<bool>.initial(),
  });

  ClientsAcceptState copyWith({
    BlocStatus<bool>? getClientsAcceptStatus,
  }) {
    return ClientsAcceptState(
      getClientsAcceptStatus:
          getClientsAcceptStatus ?? this.getClientsAcceptStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsAcceptStatus,
    ];
  }
}
