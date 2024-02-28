import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/api.dart';
import '../../../../../constants.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../domain/use_cases/add_agent_usecase.dart';

abstract class AgentsDistributorsActionsDataSource {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
  });

  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  });
}

@LazySingleton(as: AgentsDistributorsActionsDataSource)
class AgentsDistributorsActionsDataSourceImpl
    extends AgentsDistributorsActionsDataSource {
  final Api api;

  AgentsDistributorsActionsDataSourceImpl(this.api);

  @override
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
  }) async {
    try {
      final data =
          await api.get(url: url + 'config/getcity.php?fk_country=$fkCountry');
      final List<CityModel> citiesList = [];
      for (int i = 0; i < data.length; i++) {
        citiesList.add(CityModel.fromJson(data[i]));
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
        addAgentParams.filelogo,
      );
      return Right(null);
    } catch (e) {
      print("Error in addAgent: $e");
      return Left(e.toString());
    }
  }
}
