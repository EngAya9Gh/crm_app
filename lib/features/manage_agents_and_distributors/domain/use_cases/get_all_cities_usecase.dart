import 'package:dartz/dartz.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../../model/maincitymodel.dart';
import '../repositories/agents_distributors_actions_repo.dart';

class GetAllCitiesUseCase extends UseCase<Either<String, List<CityModel>>,
    GetAllCitiesUseCaseParams> {
  final AgentsDistributorsActionsRepo repository;

  GetAllCitiesUseCase(this.repository);

  @override
  Future<Either<String, List<CityModel>>> call(
      GetAllCitiesUseCaseParams params) {
    return repository.getAllCities(
      fkCountry: params.fkCountry,
      regionId: params.regionId,
    );
  }
}

class GetAllCitiesUseCaseParams {
  final String fkCountry;
  final String? regionId;

  GetAllCitiesUseCaseParams({
    required this.fkCountry,
    this.regionId,
  });
}
