import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/mangement/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';

@injectable
class GetAllUsersUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<List<UserModel>>>> {
  GetAllUsersUsecase(this.repository);

  final UsersRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> call() {
    return repository.getUsers();
  }
}
