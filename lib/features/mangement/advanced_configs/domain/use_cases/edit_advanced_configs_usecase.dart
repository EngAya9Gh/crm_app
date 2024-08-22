import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/advanced_configs_repository.dart';

@lazySingleton
class EditAdvancedConfigsUsecase
    extends BaseUsecase<Either<String, dynamic>, EditAdvancedConfigsParams> {
  EditAdvancedConfigsUsecase(this._repository);

  final AdvancedConfigsRepository _repository;

  @override
  Future<Either<String, dynamic>> call(
    EditAdvancedConfigsParams params,
  ) {
    return _repository.editAdvancedConfigs(params);
  }
}

class EditAdvancedConfigsParams {
  final List<ConfigModel> configs;

  const EditAdvancedConfigsParams({
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
