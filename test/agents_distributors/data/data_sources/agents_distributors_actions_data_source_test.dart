import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_action_model.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockApiServices mockApiServices;
  late AgentsDistributorsActionsDataSourceImpl dataSource;
  setUp(() {
    mockApiServices = MockApiServices();
    dataSource = AgentsDistributorsActionsDataSourceImpl(mockApiServices);
  });

  group("Agents and Distributors Actions DataSource", () {
    test("addAgent", () async {
      // Arrange
      final AddAgentParams addAgentParams = AddAgentParams(
        agentActionModel: AgentDistributorActionModel(),
      );

      final endPoint = EndPoints.agentDistributor.addAgent;

      when(mockApiServices.postRequestWithFile(
        endPoint: endPoint,
        data: addAgentParams.agentActionModel.toMap(),
        fileLogo: addAgentParams.agentActionModel.imageAgent,
      )).thenAnswer(
        (_) async => {
          "message": "Agent Added Successfully",
        },
      );

      // Act
      final Either<String, void> result =
          await dataSource.addAgent(addAgentParams: addAgentParams);

      // Assert
      expect(result, isA<Either<String, void>>());
    });

    test("updateAgent", () async {
      // Arrange
      final String agentId = "1";

      final UpdateAgentParams updateAgentParams = UpdateAgentParams(
        agentId: agentId,
        agentActionModel: AgentDistributorActionModel(),
      );

      final endPoint = EndPoints.agentDistributor.updateAgent(agentId);

      when(mockApiServices.postRequestWithFile(
        endPoint: endPoint,
        data: updateAgentParams.agentActionModel.toMap(),
        fileLogo: updateAgentParams.agentActionModel.imageAgent,
      )).thenAnswer(
        (_) async => {
          "message": "Agent Added Successfully",
        },
      );

      // Act
      final Either<String, void> result =
          await dataSource.updateAgent(updateAgentParams: updateAgentParams);

      // Assert
      expect(result, isA<Either<String, void>>());
    });
  });
}
