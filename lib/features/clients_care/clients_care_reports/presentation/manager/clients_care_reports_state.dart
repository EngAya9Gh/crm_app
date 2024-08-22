part of 'clients_care_reports_cubit.dart';

class ClientsCareReportsState extends Equatable {
  final BlocStatus<bool> getClientsCareReportsStatus;

  ClientsCareReportsState({
    this.getClientsCareReportsStatus = const BlocStatus<bool>.initial(),
  });

  ClientsCareReportsState copyWith({
    BlocStatus<bool>? getClientsCareReportsStatus,
  }) {
    return ClientsCareReportsState(
      getClientsCareReportsStatus:
          getClientsCareReportsStatus ?? this.getClientsCareReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsCareReportsStatus,
    ];
  }
}
