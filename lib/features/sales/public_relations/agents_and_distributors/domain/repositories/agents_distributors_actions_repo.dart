import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../model/maincitymodel.dart';
import '../use_cases/add_agent_usecase.dart';
import '../use_cases/update_agent_usecase.dart';

abstract class AgentsDistributorsActionsRepo {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
    String? regionId,
  });

  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  });

  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  });

  Future<Either<String, dynamic>> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  });
}
