part of 'special_clients_bloc.dart';

class SpecialClientsState extends Equatable {
  const SpecialClientsState({
    this.communicationListState = const PageState.init(),
    this.allCommunicationsState = const <DistinctiveClient>[],
    this.selectedCityId,
  });

  final PageState<List<DistinctiveClient>> communicationListState;
  final List<DistinctiveClient> allCommunicationsState;
  final String? selectedCityId;

  @override
  List<Object?> get props => [communicationListState, selectedCityId];

  SpecialClientsState copyWith({
    PageState<List<DistinctiveClient>>? communicationListState,
    List<DistinctiveClient>? allCommunicationsState,
    Nullable<String?>? selectedCityId1,
  }) {
    return SpecialClientsState(
      communicationListState:
          communicationListState ?? this.communicationListState,
      allCommunicationsState:
          allCommunicationsState ?? this.allCommunicationsState,
      selectedCityId:
          selectedCityId1 != null ? selectedCityId1.value : this.selectedCityId,
    );
  }
}
