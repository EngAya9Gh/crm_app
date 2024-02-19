import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../services/Invoice_Service.dart';

part 'agents_distributors_state.dart';

class AgentsDistributorsCubit extends Cubit<AgentsDistributorsState> {
  AgentsDistributorsCubit() : super(AgentsDistributorsState());

  Future<void> getAgentsAndDistributors() async {
    try {
      if (state.status == StateStatus.loading) return;
      emit(state.copyWith(
        status: StateStatus.loading,
      ));
      print("loading agents and distributors...");

      final List<AgentDistributorModel> agents =
          await Invoice_Service.getAgentsAndDistributors();

      print("agetns => $agents");
      emit(state.copyWith(
        status: StateStatus.success,
        agentsAndDistributorsList: agents,
      ));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        status: StateStatus.failure,
      ));
    }
  }
}
