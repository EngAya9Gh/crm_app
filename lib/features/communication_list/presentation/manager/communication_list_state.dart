part of 'communication_list_bloc.dart';

class CommunicationListState extends Equatable {
  const CommunicationListState({
    this.communicationListState = const PageState.init(),
    this.allCommunicationsState = const <Communication>[],
  });

  final PageState<List<Communication>> communicationListState;
  final List<Communication> allCommunicationsState;

  @override
  List<Object?> get props => [communicationListState];

  CommunicationListState copyWith({
    PageState<List<Communication>>? communicationListState,
    List<Communication>? allCommunicationsState,
  }) {
    return CommunicationListState(
      communicationListState: communicationListState ?? this.communicationListState,
      allCommunicationsState: allCommunicationsState ?? this.allCommunicationsState,
    );
  }
}
