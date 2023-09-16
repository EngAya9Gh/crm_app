part of 'communication_list_bloc.dart';

class CommunicationListState extends Equatable {
  const CommunicationListState({
    this.communicationListState = const PageState.init(),
  });

  final PageState<List<Communication>> communicationListState;

  @override
  List<Object?> get props => [communicationListState];

  CommunicationListState copyWith({
    PageState<List<Communication>>? communicationListState,
  }) {
    return CommunicationListState(
      communicationListState: communicationListState ?? this.communicationListState,
    );
  }
}
