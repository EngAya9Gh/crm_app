import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';

@lazySingleton
class ChangeStateAgentUseCase
    extends UseCase<Either<String, dynamic>, ChangeStateAgentParams> {
  ChangeStateAgentUseCase(this.repository);

  final AgentsDistributorsRepo repository;

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
