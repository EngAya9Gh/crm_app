// part of 'communication_list_bloc.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:equatable/equatable.dart';


class ParticipateListState extends Equatable {
  const ParticipateListState({
    this.particiPateListState = const PageState.init(),
    this.allParticipateState = const <ParticipateModel>[],
    // this.selectedCityId,
  });

  final PageState<List<ParticipateModel>> particiPateListState;
  final List<ParticipateModel> allParticipateState;
  // final String? selectedCityId;

  @override
  List<Object?> get props => [particiPateListState];
  // List<Object?> get props => [ParticipateListState, selectedCityId];

  ParticipateListState copyWith({
    PageState<List<ParticipateModel>>? particiPateListState,
    List<ParticipateModel>? allParticipateState,
    // Nullable<String?>? selectedCityId1,
  }) {
    return ParticipateListState(
      particiPateListState: particiPateListState ?? this.particiPateListState,
      allParticipateState: allParticipateState ?? this.allParticipateState,
      // selectedCityId: selectedCityId1 != null ? selectedCityId1.value : this.selectedCityId,
    );
  }
}
