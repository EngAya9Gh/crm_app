import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../../../domain/use_cases/waiting_agents_usecase.dart';

part 'waiting_agents_state.dart';

@injectable
class WaitingAgentsCubit extends Cubit<WaitingAgentsState> {
  final GetWaitingAgentsUsecase _getWaitingAgentsUsecase;

  WaitingAgentsCubit(
    this._getWaitingAgentsUsecase,
  ) : super(WaitingAgentsState());

  List<AgentDistributorModel> waitingAgentsList = [];

  Future<void> getWaitingAgents() async {
    if (state.getWaitingAgentsParams.page == 1 || state.resetData) {
      emit(state.copyWith(getWaitingAgentsStatus: BlocStatus.loading()));
    }
    final result = await _getWaitingAgentsUsecase(state.getWaitingAgentsParams);
    result.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(getWaitingAgentsStatus: BlocStatus.fail(error: l)));
      },
      (r) {
        if(state.getWaitingAgentsParams.page>1){
        waitingAgentsList = List.of(waitingAgentsList)..addAll(r);
        }
        else{
          waitingAgentsList=r;
        }
        emit(state.copyWith(getWaitingAgentsStatus: BlocStatus.success(),reachedMax: r.isEmpty));
      },
    );
  }

  void changeFilter([GetWaitingAgentsParams? getWaitingAgentsParams]) {
    bool isNewFilter = (state.getWaitingAgentsParams.source != getWaitingAgentsParams?.source);
    emit(state.copyWith(resetData: isNewFilter, getWaitingAgentsParams: getWaitingAgentsParams?.copyWith(page: isNewFilter?1:getWaitingAgentsParams.page) ?? GetWaitingAgentsParams()));
  }
}
