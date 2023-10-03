import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';

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
