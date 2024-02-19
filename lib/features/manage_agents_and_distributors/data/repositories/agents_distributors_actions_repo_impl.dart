import 'package:crm_smart/model/maincitymodel.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/agents_distributors_actions_repo.dart';
import '../data_sources/remote_data_source/agents_distributors_actions_data_source.dart';

class AgentsDistributorsActionsRepoImpl extends AgentsDistributorsActionsRepo {
  final AgentsDistributorsActionsDataSource agentsDistributorsActionsDataSource;

  AgentsDistributorsActionsRepoImpl(this.agentsDistributorsActionsDataSource);

  @override
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
    String? regionId,
  }) async {
    return await agentsDistributorsActionsDataSource.getAllCities(
      fkCountry: fkCountry,
    );
  }
}
