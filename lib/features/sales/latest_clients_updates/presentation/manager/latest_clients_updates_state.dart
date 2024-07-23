part of 'latest_clients_updates_cubit.dart';

class LatestClientsUpdatesState extends Equatable {
  final BlocStatus<bool> getLatestClientsStatus;

  const LatestClientsUpdatesState({
    this.getLatestClientsStatus = const BlocStatus.initial(),
  });

  LatestClientsUpdatesState copyWith({
    BlocStatus<bool>? getLatestClientsStatus,
  }) {
    return LatestClientsUpdatesState(
      getLatestClientsStatus:
          getLatestClientsStatus ?? this.getLatestClientsStatus,
    );
  }

  @override
  List<Object?> get props => [getLatestClientsStatus];
}
