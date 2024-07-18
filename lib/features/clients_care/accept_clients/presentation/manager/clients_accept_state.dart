part of 'clients_accept_cubit.dart';

class ClientsAcceptState extends Equatable {
  final BlocStatus getClientsAcceptStatus;

  ClientsAcceptState({
    this.getClientsAcceptStatus = const BlocStatus.initial(),
  });

  ClientsAcceptState copyWith({
    BlocStatus? getClientsAcceptStatus,
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
