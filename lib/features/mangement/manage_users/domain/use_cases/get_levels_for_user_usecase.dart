import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetLevelsForUserUsecase
    extends UseCase<Either<String, List<LevelModel>>, GetLevelsForUserParams> {
  GetLevelsForUserUsecase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Either<String, List<LevelModel>>> call(GetLevelsForUserParams params) {
    return _repository.getLevelsForUser(params);
  }
}

class GetLevelsForUserParams {}
