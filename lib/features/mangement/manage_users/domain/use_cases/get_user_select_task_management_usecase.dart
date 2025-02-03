import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../repositories/users_repository.dart';

@injectable
class GetUserSelectUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<UserModel>>>> {
  GetUserSelectUsecase(this.repository);

  final UsersRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> call() {
    return repository.getUserSelected();
  }
}
