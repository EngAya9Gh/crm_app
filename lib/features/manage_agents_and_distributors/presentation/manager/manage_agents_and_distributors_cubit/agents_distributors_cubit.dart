import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../domain/use_cases/get_agents_and_distributors_usecase.dart';

part 'agents_distributors_state.dart';

@injectable
class AgentsDistributorsCubit extends Cubit<AgentsDistributorsState> {
  AgentsDistributorsCubit(this.getAgentsAndDistributorsUseCase)
      : super(AgentsDistributorsState());

  final GetAgentsAndDistributorsUseCase getAgentsAndDistributorsUseCase;

  List<AgentDistributorModel> _agentsAndDistributorsList = [];

  Future<void> getAgentsAndDistributors() async {
    emit(state.copyWith(status: StateStatus.loading));

    final response = await getAgentsAndDistributorsUseCase(NoParams());

    response.fold(
      (exception) =>
          emit(state.copyWith(status: StateStatus.failure, error: exception)),
      (value) {
        _agentsAndDistributorsList = value;
        emit(state.copyWith(
          status: StateStatus.success,
          agentsAndDistributorsList: _filterAgentsAndDistributors(''),
        ));
      },
    );
  }

  // search
  void searchAgentsAndDistributors(String query) {
    emit(state.copyWith(
      agentsAndDistributorsList: _filterAgentsAndDistributors(query),
    ));
  }

  List<AgentDistributorModel> _filterAgentsAndDistributors(String query) {
    if (query.isEmpty) {
      return _agentsAndDistributorsList;
    }
    return _agentsAndDistributorsList
        .where((element) =>
            element.nameAgent.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
