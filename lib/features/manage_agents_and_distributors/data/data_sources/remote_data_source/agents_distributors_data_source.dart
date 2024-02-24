import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/agent_distributor_model.dart';
import '../../../../../services/Invoice_Service.dart';

abstract class AgentsDistributorsDataSource {
  Future<Either<String, List<AgentDistributorModel>>>
      getAgentsAndDistributors();
}

@LazySingleton(as: AgentsDistributorsDataSource)
class AgentsDistributorsDataSourceImpl extends AgentsDistributorsDataSource {
  Future<Either<String, List<AgentDistributorModel>>>
      getAgentsAndDistributors() async {
    try {
      final result = await Invoice_Service.getAgentsAndDistributors();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }
}
