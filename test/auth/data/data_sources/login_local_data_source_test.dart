import 'package:crm_smart/features/auth/login/data/data_sources/login_local_data_source.dart';
import 'package:crm_smart/features/auth/login/domain/use_cases/cache_token_usecase.dart';
import 'package:crm_smart/features/auth/login/domain/use_cases/get_token_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late LoginLocalDataSourceImpl localDataSource;
  late MockCacheServices mockCacheServices;

  setUp(() {
    mockCacheServices = MockCacheServices();
  });

  group("Login Local DataSource", () {
    test("cacheToken success", () async {
      // Arrange
      localDataSource = LoginLocalDataSourceImpl(mockCacheServices);
      final cacheTokenParams = CacheTokenParams(token: "token");
      when(mockCacheServices.saveData(
        key: "token",
        value: "token",
      )).thenAnswer((_) async => null);

      // Act
      final result = await localDataSource.cacheToken(cacheTokenParams);

      // Assert
      verify(mockCacheServices.saveData(
        key: "token",
        value: "token",
      )).called(1);
      expect(result, equals(Right<String, dynamic>(null)));
    });
  });

  test("getToken success", () async {
    // Arrange
    localDataSource = LoginLocalDataSourceImpl(mockCacheServices);
    final getTokenParams = GetTokenParams();
    when(mockCacheServices.getData(key: "token"))
        .thenAnswer((_) async => "token");

    // Act
    final result = await localDataSource.getToken(getTokenParams);

    // Assert
    verify(mockCacheServices.getData(key: "token")).called(1);
    expect(result, equals(Right<String, dynamic>("token")));
  });
}
