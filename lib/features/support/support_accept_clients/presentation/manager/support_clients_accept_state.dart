part of 'support_clients_accept_cubit.dart';

class SupportClientsAcceptState extends Equatable {
  final BlocStatus<bool> getClientsAcceptStatus;

  SupportClientsAcceptState({
    this.getClientsAcceptStatus = const BlocStatus<bool>.initial(),
  });

  SupportClientsAcceptState copyWith({
    BlocStatus<bool>? getClientsAcceptStatus,
  }) {
    return SupportClientsAcceptState(
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
