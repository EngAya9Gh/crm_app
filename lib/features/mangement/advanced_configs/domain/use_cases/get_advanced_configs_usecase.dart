import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/advanced_configs_repository.dart';

@lazySingleton
class GetAdvancedConfigsUsecase extends UseCase<
    Either<String, List<ConfigModel>>, GetAdvancedConfigsParams> {
  GetAdvancedConfigsUsecase(this._repository);

  final AdvancedConfigsRepository _repository;

  @override
  Future<Either<String, List<ConfigModel>>> call(
    GetAdvancedConfigsParams params,
  ) {
    return _repository.getAdvancedConfigs(params);
  }
}

class GetAdvancedConfigsParams {
  const GetAdvancedConfigsParams();
}
