import 'package:collection/collection.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';

@injectable
class ActionUserUsecase extends UseCase<Result<ResponseWrapper<UserModel>>, ActionUserParams> {
  ActionUserUsecase(this.repository);

  final UsersRepository repository;

  @override
  Future<Result<ResponseWrapper<UserModel>>> call(ActionUserParams params) {
    if (params.userId != null) {
      return repository.updateUser(body: params.body, param: params.params);
    }
    return repository.addUser(body: params.body, param: params.params);
  }
}

class ActionUserParams {
  final String name;
  final String email;
  final String mobile;
  final String fkCountry;
  final String typeAdministration;
  final String level;
  final String levelName;
  final String regionName;
  final String fkUserAction;
  final String fkRegion;
  final List<String> selectedMainCityIds;
  final String? userId;
  final String? isActive;

  ActionUserParams({
    required this.name,
    required this.email,
    required this.mobile,
    required this.fkCountry,
    required this.typeAdministration,
    required this.level,
    required this.levelName,
    required this.regionName,
    required this.fkUserAction,
    required this.fkRegion,
    required this.selectedMainCityIds,
    this.userId,
    this.isActive,
  });

  Map<String, dynamic> get body => userId != null
      ? {
          'email': email,
          'mobile': mobile,
          'type_administration': typeAdministration, //!= null ? namemanage : "",
          'type_level': level,
          'fk_regoin': fkRegion,
          'name_regoin': regionName,
          'name_level': levelName,
          'isActive': isActive,
          "updated_at": DateTime.now().toIso8601String(),
          "fkuserupdate": fkUserAction,
        }
      : {
          "nameUser": name,
          'email': email,
          'mobile': mobile,
          'fk_country': fkCountry,
          'type_administration': typeAdministration,
          'type_level': level,
          'name_level': levelName,
          'name_regoin': regionName,
          'fkuserAdd': fkUserAction,
          'fk_regoin': fkRegion,
        };

  Map<String, dynamic> get params {
    final map = <String, dynamic>{};

    selectedMainCityIds.forEachIndexed((index, element) {
      map["maincity_fks[$index]"] = element;
    });

    if (userId != null) map["id_user"] = userId;

    return map;
  }
}
