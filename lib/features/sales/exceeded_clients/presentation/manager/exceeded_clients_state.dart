part of 'exceeded_clients_cubit.dart';

class ExceededClientsState extends Equatable {
  final BlocStatus<bool> getExceededClientsStatus;
  final BlocStatus locallyFilterExceededClientsStatus;
  final BlocStatus transferExceededClientsStatus;

  ExceededClientsState({
    this.getExceededClientsStatus = const BlocStatus<bool>.initial(),
    this.locallyFilterExceededClientsStatus = const BlocStatus<bool>.initial(),
    this.transferExceededClientsStatus = const BlocStatus.initial(),
  });

  ExceededClientsState copyWith({
    BlocStatus<bool>? getExceededClientsStatus,
    BlocStatus? locallyFilterExceededClientsStatus,
    BlocStatus? transferExceededClientsStatus,
  }) {
    return ExceededClientsState(
      getExceededClientsStatus:
          getExceededClientsStatus ?? this.getExceededClientsStatus,
      locallyFilterExceededClientsStatus: locallyFilterExceededClientsStatus ??
          this.locallyFilterExceededClientsStatus,
      transferExceededClientsStatus:
          transferExceededClientsStatus ?? this.transferExceededClientsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getExceededClientsStatus,
      locallyFilterExceededClientsStatus,
      transferExceededClientsStatus,
    ];
  }
}
