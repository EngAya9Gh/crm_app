import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/api.dart';
import '../../../../../constants.dart';
import '../../../../../core/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../domain/use_cases/add_agent_usecase.dart';
import '../../../domain/use_cases/update_agent_usecase.dart';

abstract class AgentsDistributorsActionsDataSource {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
  });

  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  });

  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  });
}

@LazySingleton(as: AgentsDistributorsActionsDataSource)
class AgentsDistributorsActionsDataSourceImpl
    extends AgentsDistributorsActionsDataSource {
  final ApiServices apiServices;

  AgentsDistributorsActionsDataSourceImpl(this.apiServices);

  @override
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
  }) async {
    try {
      apiServices.changeBaseUrl(EndPoints.phpUrl);
      final response = await apiServices.get(
        endPoint: "${EndPoints.city.getAllCities}$fkCountry",
      );

      final data = response["message"];

      final List<CityModel> citiesList = [];
      for (var city in data) {
        citiesList.add(CityModel.fromJson(city));
      }
      return Right(citiesList);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  }) async {
    try {
      await Api().postRequestWithFile(
        "array",
        url + 'agent/add_agent.php',
        addAgentParams.agentActionModel.toMap(),
        addAgentParams.file,
        addAgentParams.agentActionModel.filelogo,
      );
      return Right(null);
    } catch (e) {
      print("Error in addAgent: $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  }) async {
    try {
      await Api().postRequestWithFile(
        "array",
        url + 'agent/update_agent.php?id_agent=${updateAgentParams.agentId}',
        updateAgentParams.agentActionModel.toMap(),
        updateAgentParams.file,
        updateAgentParams.agentActionModel.filelogo,
      );
      return Right(null);
    } catch (e) {
      print("Error in updateAgent: $e");
      return Left(e.toString());
    }
  }
}
