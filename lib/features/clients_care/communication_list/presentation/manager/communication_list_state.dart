part of 'communication_list_bloc.dart';

class CommunicationListState extends Equatable {
  const CommunicationListState({
    this.communicationListState = const PageState.init(),
    this.allCommunicationsState = const <DistinctiveClient>[],
    this.selectedCityId,
  });

  final PageState<List<DistinctiveClient>> communicationListState;
  final List<DistinctiveClient> allCommunicationsState;
  final String? selectedCityId;

  @override
  List<Object?> get props => [communicationListState, selectedCityId];

  CommunicationListState copyWith({
    PageState<List<DistinctiveClient>>? communicationListState,
    List<DistinctiveClient>? allCommunicationsState,
    Nullable<String?>? selectedCityId1,
  }) {
    return CommunicationListState(
      communicationListState: communicationListState ?? this.communicationListState,
      allCommunicationsState: allCommunicationsState ?? this.allCommunicationsState,
      selectedCityId: selectedCityId1 != null ? selectedCityId1.value : this.selectedCityId,
    );
  }
}
