part of 'support_clients_accept_cubit.dart';

class SupportClientsAcceptState extends Equatable {
  final BlocStatus<bool> getClientsAcceptStatus;
  final BlocStatus locallyFilterClientsAcceptStatus;

  SupportClientsAcceptState({
    this.getClientsAcceptStatus = const BlocStatus<bool>.initial(),
    this.locallyFilterClientsAcceptStatus = const BlocStatus<bool>.initial(),
  });

  SupportClientsAcceptState copyWith({
    BlocStatus<bool>? getClientsAcceptStatus,
    BlocStatus? locallyFilterClientsAcceptStatus,
  }) {
    return SupportClientsAcceptState(
      getClientsAcceptStatus:
          getClientsAcceptStatus ?? this.getClientsAcceptStatus,
      locallyFilterClientsAcceptStatus: locallyFilterClientsAcceptStatus ??
          this.locallyFilterClientsAcceptStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsAcceptStatus,
      locallyFilterClientsAcceptStatus,
    ];
  }
}
