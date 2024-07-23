import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/prepare_params_list.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/usermodel.dart';
import '../repositories/users_repository.dart';

@injectable
class ActionUserUsecase
    extends UseCase<Result<ResponseWrapper<UserModel>>, ActionUserParams> {
  ActionUserUsecase(this.repository);

  final UsersRepository repository;

  @override
  Future<Result<ResponseWrapper<UserModel>>> call(ActionUserParams params) {
    if (params.userId == null) {
      return repository.addUser(body: params.body, param: {});
    }
    return repository
        .updateUser(body: params.body, param: {'id_user': params.userId});
  }
}

class ActionUserParams {
  final String fkRegion;
  final String typeAdministration;
  final String level;
  final String name;
  final String email;
  final String? isActive;

  final String mobile;
  final List<String> selectedMainCityIds;

  final String? userId;

  ActionUserParams({
    required this.fkRegion,
    required this.typeAdministration,
    required this.level,
    required this.name,
    required this.email,
    this.isActive,
    required this.mobile,
    required this.selectedMainCityIds,
    this.userId,
  });

  Map<String, dynamic> get body {
    Map<String, dynamic> map = {
      'fk_regoin': fkRegion,
      'type_administration': typeAdministration,
      'type_level': level,
      'email': email,
      'mobile': mobile,
      ...prepareParamsList(
        key: 'maincity_fks',
        values: selectedMainCityIds,
      ),
    };
    if (userId == null) {
      map["nameUser"] = name;
    } else if (userId != null) {
      map["isActive"] = isActive;
    }

    return map;
  }
}
