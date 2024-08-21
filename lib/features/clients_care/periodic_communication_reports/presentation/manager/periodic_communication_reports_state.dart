part of 'periodic_communication_reports_cubit.dart';

class PeriodicCommunicationReportsState extends Equatable {
  final BlocStatus<bool> getPeriodicCommunicationReportsStatus;

  PeriodicCommunicationReportsState({
    this.getPeriodicCommunicationReportsStatus =
        const BlocStatus<bool>.initial(),
  });

  PeriodicCommunicationReportsState copyWith({
    BlocStatus<bool>? getPeriodicCommunicationReportsStatus,
  }) {
    return PeriodicCommunicationReportsState(
      getPeriodicCommunicationReportsStatus:
          getPeriodicCommunicationReportsStatus ??
              this.getPeriodicCommunicationReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getPeriodicCommunicationReportsStatus,
    ];
  }
}
