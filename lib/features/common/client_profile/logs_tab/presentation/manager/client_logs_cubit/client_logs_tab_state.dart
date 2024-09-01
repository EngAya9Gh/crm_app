part of 'client_logs_tab_cubit.dart';

class ClientLogsTabState {
  final BlocStatus<bool> getClientLogsStatus;

  ClientLogsTabState({
    this.getClientLogsStatus = const BlocStatus.initial(),
  });

  ClientLogsTabState copyWith({
    BlocStatus<bool>? getClientLogsStatus,
  }) {
    return ClientLogsTabState(
      getClientLogsStatus: getClientLogsStatus ?? this.getClientLogsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientLogsStatus,
    ];
  }
}
