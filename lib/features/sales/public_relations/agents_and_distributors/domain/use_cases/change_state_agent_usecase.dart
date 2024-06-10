import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../repositories/agents_distributors_actions_repo.dart';

@lazySingleton
class ChangeStateAgentUseCase
    extends UseCase<Either<String, dynamic>, ChangeStateAgentParams> {
  ChangeStateAgentUseCase(this.repository);

  final AgentsDistributorsActionsRepo repository;

  @override
  Future<Either<String, dynamic>> call(ChangeStateAgentParams params) {
    return repository.changeStateAgent(changeStateAgentParams: params);
  }
}

class ChangeStateAgentParams {
  final String agentId;
  final String state;
  final String? reasonState;
  final String? date;

  ChangeStateAgentParams({
    required this.agentId,
    required this.state,
    this.reasonState,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'reason_state': reasonState,
      // todo : wait for backend to add the date field
      'date': date,
    };
  }
}
