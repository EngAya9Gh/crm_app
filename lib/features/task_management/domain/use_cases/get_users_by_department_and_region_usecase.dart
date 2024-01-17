import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/task_management/domain/repositories/task_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/user_region_department.dart';

@injectable
class GetUsersByDepartmentAndRegionUsecase
    extends UseCase<Result<ResponseWrapper<List<UserRegionDepartment>>>, GetUsersByDepartmentAndRegionParams> {
  GetUsersByDepartmentAndRegionUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserRegionDepartment>>>> call(GetUsersByDepartmentAndRegionParams params) {
    return repository.getUsersByTypeAdministrationAndRegion(params.toMap);
  }
}

class GetUsersByDepartmentAndRegionParams {
  GetUsersByDepartmentAndRegionParams({this.regionId, this.departmentId});

  final String? regionId;
  final String? departmentId;

  Map<String, dynamic> get toMap => {
        'type_administration[0]': this.departmentId,
        'fk_regoin[0]': this.regionId,
      }..removeWhere((key, value) => value == null || value == '');
}
