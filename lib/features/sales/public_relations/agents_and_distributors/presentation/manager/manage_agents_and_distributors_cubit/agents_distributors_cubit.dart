import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/enums/agents/agent_status_enum.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../model/agent_distributor_model.dart';
import '../../../domain/use_cases/get_agents_and_distributors_usecase.dart';

part 'agents_distributors_state.dart';

@injectable
class AgentsDistributorsCubit extends Cubit<AgentsDistributorsState> {
  final GetAgentsAndDistributorsUseCase _getAgentsAndDistributorsUseCase;
  final ChangeStateAgentUseCase _changeStateAgentUseCase;

  AgentsDistributorsCubit(
    this._getAgentsAndDistributorsUseCase,
    this._changeStateAgentUseCase,
  ) : super(AgentsDistributorsState());

  ValueNotifier<AgentStateEnum?> filterAgentState = ValueNotifier(null);
  final TextEditingController searchTextField = TextEditingController();

  AgentDistributorModel? currentAgent;
  List<AgentDistributorModel> _agentsAndDistributorsList = [];

  Future<void> getAgentsAndDistributors({bool isDebounce = false}) async {
    EasyDebounce.debounce(
      'getAgentsAndDistributors',
      Duration(milliseconds: isDebounce ? 500 : 0),
      () => _getAgentsAndDistributors(),
    );
  }

  Future<void> _getAgentsAndDistributors() async {
    emit(state.copyWith(status: StateStatus.loading));

    final response = await _getAgentsAndDistributorsUseCase(
      GetAgentsAndDistributorsParams(
        searchQuery: searchTextField.text,
        agentState: filterAgentState.value?.value,
      ),
    );

    response.fold(
      (exception) =>
          emit(state.copyWith(status: StateStatus.failure, error: exception)),
      (value) {
        _agentsAndDistributorsList = value;
        emit(state.copyWith(
          status: StateStatus.success,
          agentsAndDistributorsList: value,
        ));
      },
    );
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
        final AgentDistributorModel agent = r as AgentDistributorModel;
        _updateTheLocalValue(agent);
        emit(state.copyWith(
          changeStateAgent: BlocStatus.success(),
          agentsAndDistributorsList: _agentsAndDistributorsList,
        ));
      },
    );
  }

  void _updateTheLocalValue(AgentDistributorModel agent) {
    currentAgent = agent;
    _agentsAndDistributorsList = _agentsAndDistributorsList.map((e) {
      if (e.idAgent == agent.idAgent) {
        return agent;
      }
      return e;
    }).toList();
  }
}
