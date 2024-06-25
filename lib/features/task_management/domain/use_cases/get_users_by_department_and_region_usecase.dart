import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/user_region_department.dart';

@injectable
class GetUsersByDepartmentAndRegionUsecase extends UseCase<
    Result<ResponseWrapper<List<UserRegionDepartment>>>,
    GetUsersByDepartmentAndRegionParams> {
  GetUsersByDepartmentAndRegionUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserRegionDepartment>>>> call(
      GetUsersByDepartmentAndRegionParams params) {
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
