import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/users/active_state_enum.dart';
import '../../../../../core/common/helpers/calculate_page.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/regoin_model.dart';
import '../../../../../model/usermodel.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../../manage_privilege/data/models/privilege_model.dart';
import '../repositories/users_repository.dart';

@injectable
class GetUsersUsecase
    extends UseCase<Result<ResponseWrapper<List<UserModel>>>, GetUsersParams> {
  GetUsersUsecase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> call(GetUsersParams params) {
    return _repository.getUsers(params);
  }
}

class GetUsersParams {
  final int skip;
  final int limit;
  final String? filter;
  final ActiveStateEnum? isActive;
  final RegionModel? region;
  final ManageModel? management;
  final LevelModel? level;
  final List<PrivilegeModel>? privileges;

  const GetUsersParams({
    this.skip = 0,
    this.limit = 25,
    this.filter,
    this.isActive,
    this.region,
    this.management,
    this.level,
    this.privileges,
  });

  toParams() {
    return {
      'page': calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': filter,
      'isActive': isActive?.toParam(),
      'fk_regoin': region?.regionId,
      'type_administration': management?.idmange,
      'type_level': level?.idLevel,
      ..._preparePrivileges(),
    };
  }

  Map<String, String> _preparePrivileges() {
    if (privileges == null || privileges!.isEmpty) {
      return {};
    }
    final Map<String, String> map = {};
    for (int idx = 0; idx < privileges!.length; idx++) {
      map['privilege[$idx]'] = privileges![idx].fkPrivilege!;
    }
    return map;
  }
}
