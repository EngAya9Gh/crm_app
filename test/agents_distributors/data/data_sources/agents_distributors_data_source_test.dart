import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockApiServices mockApiServices;
  late AgentsDistributorsDataSourceImpl dataSource;

  setUp(() {
    mockApiServices = MockApiServices();
    dataSource = AgentsDistributorsDataSourceImpl(mockApiServices);
  });

  group("Agents and Distributors DataSource", () {
    test("getAgentsAndDistributors", () async {
      // Arrange
      final String endPoint =
          EndPoints.agentDistributor.getAgentsAndDistributors;

      when(mockApiServices.get(
        endPoint: endPoint,
      )).thenAnswer((_) async => {
            "message": [
              {
                "id_agent": "70",
                "name_agent": "a5aa",
                "type_agent": "0",
                "email_egent": "",
                "mobile_agent": "123",
                "fk_country": null,
                "description": "",
                "image_agent": "",
                "cityId": "21",
                "add_date": "2024-02-28 19:48:55",
                "update_date": "2024-02-28 19:49:13",
                "fk_user_add": "423",
                "fk_user_update": "423",
                "fkuser_training": null,
                "is_training": null,
                "date_training": null,
                "name_city": "الضاحية",
                "nameUserAdd": "abdullah.bokl",
                "nameUserUpdate": "abdullah.bokl",
                "nameusertraining": null
              },
              {
                "id_agent": "69",
                "name_agent": "6aa7",
                "type_agent": "0",
                "email_egent": "",
                "mobile_agent": "",
                "fk_country": null,
                "description": "",
                "image_agent": "",
                "cityId": "47",
                "add_date": "2024-02-28 06:33:08",
                "update_date": "2024-02-28 06:33:48",
                "fk_user_add": "423",
                "fk_user_update": "423",
                "fkuser_training": "423",
                "is_training": "1",
                "date_training": "2024-02-28 19:39:20",
                "name_city": "القطيف",
                "nameUserAdd": "abdullah.bokl",
                "nameUserUpdate": "abdullah.bokl",
                "nameusertraining": "abdullah.bokl"
              },
            ]
          });

      // Act
      final result = await dataSource.getAgentsAndDistributors();

      // Assert
      expect(result, isA<Either<String, List<AgentDistributorModel>>>());
    });
  });
}
