import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'waiting_agents_state.dart';

class WaitingAgentsCubit extends Cubit<WaitingAgentsState> {
  WaitingAgentsCubit() : super(WaitingAgentsInitial());
}
