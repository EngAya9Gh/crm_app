import '../../../../../model/managmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetManagesForUserUsecase extends UseCase<
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
