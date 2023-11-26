import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/app/data/models/update_config.dart';
import 'package:crm_smart/features/app/domain/repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetVersionUseCase extends UseCaseNoParam<Result<ResponseWrapper<List<UpdateConfig>>>> {
  GetVersionUseCase(this._repository);

  final AppRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<UpdateConfig>>>> call() {
    return _repository.getVersions();
  }
}
