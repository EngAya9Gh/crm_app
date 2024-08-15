import 'package:crm_smart/core/services/cache_services/cache_services.dart';
import 'package:crm_smart/core/services/cache_services/secure_storage_consumer.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock class for FlutterSecureStorage

void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    await getIt.allReady();

    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    await secureStorage.saveData(
      key: AppStrings.secureStorage.token,
      value: '516|hWs97ZndCO2iCLlmk0KcnxTmTJW1wVVswk4eqNM12128e08d',
    );
  });

  group("Agents and Distributors", () {
    test("getAgentsAndDistributors", () async {
      // Arrange

      // act
      final result = await getIt<GetAgentsAndDistributorsUseCase>()
          .call(GetAgentsAndDistributorsParams());

      // Assert
      expect(result, isA<Either<String, List<AgentDistributorModel>>>());
      result.fold(
        (error) =>
            fail('Expected a successful fetch, but got an error: $error'),
        (data) => expect(data, isNotEmpty),
      );
    });
  });
}
