part of 'special_clients_bloc.dart';

class SpecialClientsState extends Equatable {
  const SpecialClientsState({
    this.communicationListState = const PageState.init(),
    this.allCommunicationsState = const <DistinctiveClient>[],
    this.selectedCityId,
    this.total=0,
    this.hasReachedMax = false,
  });

  final PageState<List<DistinctiveClient>> communicationListState;
  final List<DistinctiveClient> allCommunicationsState;
  final String? selectedCityId;
  final bool hasReachedMax;
  final int total;

  @override
  List<Object?> get props => [communicationListState, selectedCityId, hasReachedMax,total];

  SpecialClientsState copyWith({
    PageState<List<DistinctiveClient>>? communicationListState,
    List<DistinctiveClient>? allCommunicationsState,
    Nullable<String?>? selectedCityId1,
    bool? hasReachedMax,
    int? total,
  }) {
    return SpecialClientsState(
      communicationListState: communicationListState ?? this.communicationListState,
      total: total ?? this.total,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      allCommunicationsState: allCommunicationsState ?? this.allCommunicationsState,
      selectedCityId: selectedCityId1 != null ? selectedCityId1.value : this.selectedCityId,
    );
  }
}
