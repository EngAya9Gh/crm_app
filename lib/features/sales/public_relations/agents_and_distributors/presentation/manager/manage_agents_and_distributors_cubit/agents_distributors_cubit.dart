import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/use_case/use_case.dart';
import '../../../../../../../model/agent_distributor_model.dart';
import '../../../domain/use_cases/get_agents_and_distributors_usecase.dart';

part 'agents_distributors_state.dart';

@injectable
class AgentsDistributorsCubit extends Cubit<AgentsDistributorsState> {
  AgentsDistributorsCubit(
    this._getAgentsAndDistributorsUseCase,
    this._changeStateAgentUseCase,
  ) : super(AgentsDistributorsState());

  final GetAgentsAndDistributorsUseCase _getAgentsAndDistributorsUseCase;
  final ChangeStateAgentUseCase _changeStateAgentUseCase;

  List<AgentDistributorModel> _agentsAndDistributorsList = [];
  String searchQuery = '';

  Future<void> getAgentsAndDistributors() async {
    emit(state.copyWith(status: StateStatus.loading));

    final response = await _getAgentsAndDistributorsUseCase(NoParams());

    response.fold(
      (exception) =>
          emit(state.copyWith(status: StateStatus.failure, error: exception)),
      (value) {
        _agentsAndDistributorsList = value;
        emit(state.copyWith(
          status: StateStatus.success,
          agentsAndDistributorsList: _filterAgentsAndDistributors(),
        ));
      },
    );
  }

  // search
  void searchAgentsAndDistributors() {
    emit(state.copyWith(
      agentsAndDistributorsList: _filterAgentsAndDistributors(),
    ));
  }

  List<AgentDistributorModel> _filterAgentsAndDistributors() {
    return _agentsAndDistributorsList.where((element) {
      return element.toString().toLowerCase().contains(searchQuery);
    }).toList();
  }

  Future<void> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  }) async {
    emit(state.copyWith(changeStateAgent: BlocStatus.loading()));
    final response = await _changeStateAgentUseCase(
      changeStateAgentParams,
    );

    response.fold(
      (l) {
        emit(state.copyWith(changeStateAgent: BlocStatus.fail(error: l)));
      },
      (r) {
        final ClientModel1 client = r as ClientModel1;
        emit(state.copyWith(
          changeStateAgent: BlocStatus.success(),
        ));
      },
    );
  }
}
