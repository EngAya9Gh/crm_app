import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/api.dart';
import '../../../../../constants.dart';
import '../../../../../model/maincitymodel.dart';

abstract class AgentsDistributorsActionsDataSource {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
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
}
