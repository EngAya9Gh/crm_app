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
    emit(state.copyWith(getWaitingAgentsStatus: BlocStatus.loading()));
    final result = await _getWaitingAgentsUsecase(GetWaitingAgentsParams());
    result.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(getWaitingAgentsStatus: BlocStatus.fail(error: l)));
      },
      (r) {
        waitingAgentsList = r;
        emit(state.copyWith(getWaitingAgentsStatus: BlocStatus.success()));
      },
    );
  }
}
