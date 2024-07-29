part of 'exceeded_clients_cubit.dart';

class ExceededClientsState extends Equatable {
  final BlocStatus<bool> getExceededClientsStatus;
  final BlocStatus locallyFilterExceededClientsStatus;

  ExceededClientsState({
    this.getExceededClientsStatus = const BlocStatus<bool>.initial(),
    this.locallyFilterExceededClientsStatus = const BlocStatus<bool>.initial(),
  });

  ExceededClientsState copyWith({
    BlocStatus<bool>? getExceededClientsStatus,
    BlocStatus? locallyFilterExceededClientsStatus,
  }) {
    return ExceededClientsState(
      getExceededClientsStatus:
          getExceededClientsStatus ?? this.getExceededClientsStatus,
      locallyFilterExceededClientsStatus: locallyFilterExceededClientsStatus ??
          this.locallyFilterExceededClientsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getExceededClientsStatus,
      locallyFilterExceededClientsStatus,
    ];
  }
}
