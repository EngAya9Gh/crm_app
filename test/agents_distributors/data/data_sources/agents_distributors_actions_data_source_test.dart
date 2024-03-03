import 'dart:io';

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/models/agent_distributor_action_model.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockApiServices mockApiServices;
  late AgentsDistributorsActionsDataSourceImpl dataSource;
  late Api api = Api();
  setUp(() {
    mockApiServices = MockApiServices();
    dataSource = AgentsDistributorsActionsDataSourceImpl(mockApiServices);
  });

  group("Agents and Distributors Actions DataSource", () {
    test("getAllCities", () async {
      // Arrange
      final String fkCountry = "1";

      final endPoint = "${EndPoints.city.getAllCities}$fkCountry";

      when(mockApiServices.get(endPoint: endPoint)).thenAnswer(
        (_) async => {
          "message": [
            {
              "id_city": 87,
              "name_city": "المضيليف",
              "fk_maincity": 15,
              "mainc": "خارج السعودية"
            },
          ],
        },
      );

      // Act
      final Either<String, List<CityModel>> result =
          await dataSource.getAllCities(fkCountry: fkCountry);

      // Assert
      expect(result, isA<Either<String, List<CityModel>>>());
    });

    test("addAgent", () async {
      // Arrange
      final String fkCountry = "1";

      final AddAgentParams addAgentParams = AddAgentParams(
        agentActionModel: AgentDistributorActionModel(),
        files: [],
        file: File(""),
      );

      final endPoint = EndPoints.agentDistributor.addAgent;

      when(mockApiServices.postRequestWithFile(
        "array",
        endPoint,
        addAgentParams.agentActionModel.toMap(),
        addAgentParams.file,
        addAgentParams.agentActionModel.filelogo,
        files: addAgentParams.files,
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
  });
}
