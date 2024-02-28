import 'package:dartz/dartz.dart';

import '../../../../model/maincitymodel.dart';
import '../use_cases/add_agent_usecase.dart';

abstract class AgentsDistributorsActionsRepo {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
    String? regionId,
  });

  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  });
}
