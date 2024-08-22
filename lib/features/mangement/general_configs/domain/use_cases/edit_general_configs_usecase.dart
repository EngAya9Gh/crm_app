import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/general_configs_repository.dart';

@lazySingleton
class EditGeneralConfigsUsecase
    extends BaseUsecase<Either<String, dynamic>, EditGeneralConfigsParams> {
  EditGeneralConfigsUsecase(this._repository);

  final GeneralConfigsRepository _repository;

  @override
  Future<Either<String, dynamic>> call(
    EditGeneralConfigsParams params,
  ) {
    return _repository.editGeneralConfigs(params);
  }
}

class EditGeneralConfigsParams {
  final List<ConfigModel> configs;

  const EditGeneralConfigsParams({
    required this.configs,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
    for (var i = 0; i < configs.length; i++) {
      map['configs[$i][id]'] = configs[i].idConfig;
      map['configs[$i][value]'] = configs[i].valueConfig;
    }
    return map;
  }
}
