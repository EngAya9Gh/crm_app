// part of 'communication_list_bloc.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/models/page_state/bloc_status.dart';


class ParticipateListState extends Equatable {
   ParticipateListState({
    this.particiPateListState = const PageState.init(),
    this.allParticipateState = const <ParticipateModel>[],
    this.actionParticipateBlocStatus = const BlocStatus.initial(),
  });

  final PageState<List<ParticipateModel>> particiPateListState;
  final List<ParticipateModel> allParticipateState;
  final BlocStatus actionParticipateBlocStatus;

  @override
  List<Object?> get props => [particiPateListState,allParticipateState,actionParticipateBlocStatus];
  ParticipateListState copyWith({
    PageState<List<ParticipateModel>>? particiPateListState,
    List<ParticipateModel>? allParticipateState,
    BlocStatus? actionParticipateBlocStatus
  }) {
 
   return ParticipateListState(
      particiPateListState: particiPateListState ?? this.particiPateListState,
      allParticipateState: allParticipateState ?? this.allParticipateState,
      actionParticipateBlocStatus: actionParticipateBlocStatus ??   this.actionParticipateBlocStatus
    );
  }
}
