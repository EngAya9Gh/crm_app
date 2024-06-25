import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/update_config.dart';
import '../repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetVersionUseCase
    extends UseCaseNoParam<Result<ResponseWrapper<List<UpdateConfig>>>> {
  GetVersionUseCase(this._repository);

  final AppRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<UpdateConfig>>>> call() {
    return _repository.getVersions();
  }
}
