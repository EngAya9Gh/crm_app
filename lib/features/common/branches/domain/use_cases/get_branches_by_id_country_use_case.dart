import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/branches_repository.dart';

@lazySingleton
class GetBranchesByIdCountryUseCase extends BaseUsecase<
    Either<String, List<BranchModel>>, GetBranchesByIdCountryParams> {
  final BranchesRepository repository;

  GetBranchesByIdCountryUseCase(this.repository);

  @override
  Future<Either<String, List<BranchModel>>> call(
    GetBranchesByIdCountryParams params,
  ) {
    return repository.getBranchesByIdCountry(params);
  }
}

class GetBranchesByIdCountryParams {
  const GetBranchesByIdCountryParams();
}
