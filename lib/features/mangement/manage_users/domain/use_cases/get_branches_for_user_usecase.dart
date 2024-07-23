import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/branch_model.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetBranchesForUserUsecase extends UseCase<
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
