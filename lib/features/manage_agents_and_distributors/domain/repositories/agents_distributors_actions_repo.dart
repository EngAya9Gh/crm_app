import 'package:dartz/dartz.dart';

import '../../../../model/maincitymodel.dart';

abstract class AgentsDistributorsActionsRepo {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
    String? regionId,
  });
}
