import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../model/managmodel.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetManagesForUserUsecase extends BaseUsecase<
    Either<String, List<ManageModel>>, GetManagesForUserParams> {
  GetManagesForUserUsecase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Either<String, List<ManageModel>>> call(
      GetManagesForUserParams params) {
    return _repository.getManagesForUser(params);
  }
}

class GetManagesForUserParams {}
