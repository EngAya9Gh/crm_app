import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart';
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
  });
}
