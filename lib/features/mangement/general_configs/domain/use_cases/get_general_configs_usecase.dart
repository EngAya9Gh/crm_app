import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/general_configs_repository.dart';

@lazySingleton
class GetGeneralConfigsUsecase extends UseCase<
    Either<String, List<ConfigModel>>, GetGeneralConfigsParams> {
  GetGeneralConfigsUsecase(this._repository);

  final GeneralConfigsRepository _repository;

  @override
  Future<Either<String, List<ConfigModel>>> call(
    GetGeneralConfigsParams params,
  ) {
    return _repository.getGeneralConfigs(params);
  }
}

class GetGeneralConfigsParams {
  const GetGeneralConfigsParams();
}
