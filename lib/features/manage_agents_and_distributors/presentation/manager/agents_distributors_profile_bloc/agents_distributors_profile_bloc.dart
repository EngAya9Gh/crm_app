import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../clients_list/data/models/clients_list_response.dart';
import '../../../domain/use_cases/get_agent_client_list_usecase.dart';

part 'agents_distributors_profile_event.dart';
part 'agents_distributors_profile_state.dart';

class AgentsDistributorsProfileBloc extends Bloc<AgentsDistributorsProfileEvent,
    AgentsDistributorsProfileState> {
  final GetAgentClientListUsecase _getAgentClientListUsecase;

  AgentsDistributorsProfileBloc(this._getAgentClientListUsecase)
      : super(AgentsDistributorsProfileState()) {
    on<GetAgentClientListEvent>(_onGetAgentClientListEvent);
  }

  List<ClientModel> _agentClientsList = [];

  void _onGetAgentClientListEvent(GetAgentClientListEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final result =
        await _getAgentClientListUsecase.call(event.getAgentClientListParams);
    result.fold(
      (error) {
        emit(state.copyWith(
          status: StateStatus.failure,
          error: error,
        ));
      },
      (data) {
        _agentClientsList = data;
        emit(state.copyWith(
          status: StateStatus.success,
          agentClientsList: _filterClientList(event.query),
        ));
      },
    );
  }

  List<ClientModel> _filterClientList(String query) {
    return _agentClientsList
        .where((element) => element.nameClient!.toLowerCase().contains(query))
        .toList();
  }
}
