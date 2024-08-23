import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/enums/agents/agent_source_enum.dart';
import '../../../../../../../core/common/enums/agents/agent_status_enum.dart';
import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/models/location/city_model.dart';
import '../../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../common/cities/presentation/manager/cities_cubit.dart';
import '../../../data/models/agent_distributor_model.dart';
import '../../../domain/use_cases/change_state_agent_usecase.dart';
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
  ValueNotifier<AgentSourceEnum?> filterAgentSource = ValueNotifier(null);
  ValueNotifier<CityModel?> filterCity = ValueNotifier(null);
  final TextEditingController searchTextField = TextEditingController();

  AgentDistributorModel? currentAgent;
  List<AgentDistributorModel> _agentsAndDistributorsList = [];

  void clear(BuildContext context) {
    searchTextField.clear();
    filterAgentState.value = null;
    filterAgentSource.value = null;
    filterCity.value = null;
    context.read<CitiesCubit>().selectedCity = null;
  }

  void editAgent(AgentDistributorModel agent) {
    final idx = _agentsAndDistributorsList
        .indexWhere((e) => e.idAgent == agent.idAgent);
    if (idx != -1) {
      _agentsAndDistributorsList[idx] = agent;
      currentAgent = agent;
    } else {
      _agentsAndDistributorsList.add(agent);
    }
    emit(state.copyWith(agentsAndDistributorsList: _agentsAndDistributorsList));
  }

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
        agentSource: filterAgentSource.value?.value,
        cityId: filterCity.value?.cityId,
      ),
    );

    response.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(status: StateStatus.failure, error: error));
      },
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
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(changeStateAgent: BlocStatus.fail(error: error)));
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
