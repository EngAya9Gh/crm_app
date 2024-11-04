part of 'clients_dates_cubit.dart';

class ClientsDatesState extends Equatable {
  final BlocStatus getAllClientsDatesStatus;
  final List<ClientDateModel> clientDates;
  final int refreshUi;
  final BlocStatus renderEventsStatus;
  const ClientsDatesState({
    this.getAllClientsDatesStatus = const BlocStatus.initial(),
    this.renderEventsStatus = const BlocStatus.initial(),
    this.clientDates = const [],
    this.refreshUi = 0,

  });

  ClientsDatesState copyWith({
    int? refreshUi,
    BlocStatus? renderEventsStatus,
    BlocStatus? getAllClientsDatesStatus,
    List<ClientDateModel>? clientDates,

  }) {
    return ClientsDatesState(
      getAllClientsDatesStatus: getAllClientsDatesStatus ?? this.getAllClientsDatesStatus,
      clientDates: clientDates ?? this.clientDates,
      renderEventsStatus: renderEventsStatus ?? this.renderEventsStatus,
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,

    );
  }

  @override
  List<Object> get props => [
    getAllClientsDatesStatus,
    refreshUi,
    renderEventsStatus,
    clientDates,
  ];
}