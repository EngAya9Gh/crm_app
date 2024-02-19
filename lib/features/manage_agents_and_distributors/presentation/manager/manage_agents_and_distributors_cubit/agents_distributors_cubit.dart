import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../domain/use_cases/get_agents_and_distributors_usecase.dart';

part 'agents_distributors_state.dart';

class AgentsDistributorsCubit extends Cubit<AgentsDistributorsState> {
  AgentsDistributorsCubit(this.getAgentsAndDistributorsUseCase)
      : super(AgentsDistributorsState());

  final GetAgentsAndDistributorsUseCase getAgentsAndDistributorsUseCase;

  Future<void> getAgentsAndDistributors() async {
    emit(state.copyWith(status: StateStatus.loading));

    final response = await getAgentsAndDistributorsUseCase(NoParams());

    response.fold(
      (exception) =>
          emit(state.copyWith(status: StateStatus.failure, error: exception)),
      (value) => emit(state.copyWith(
        status: StateStatus.success,
        agentsAndDistributorsList: value,
      )),
    );
  }
}
