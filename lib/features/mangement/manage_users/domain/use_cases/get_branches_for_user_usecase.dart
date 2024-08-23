import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetBranchesForUserUsecase extends BaseUsecase<
    Either<String, List<BranchModel>>, GetBranchesForUserParams> {
  GetBranchesForUserUsecase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Either<String, List<BranchModel>>> call(
      GetBranchesForUserParams params) {
    return _repository.getBranchesForUser(params);
  }
}

class GetBranchesForUserParams {}
