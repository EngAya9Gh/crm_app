import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/config_model.dart';
import '../use_cases/edit_general_configs_usecase.dart';
import '../use_cases/get_general_configs_usecase.dart';

abstract class GeneralConfigsRepository {
  Future<Either<String, List<ConfigModel>>> getGeneralConfigs(
    GetGeneralConfigsParams params,
  );

  Future<Either<String, dynamic>> editGeneralConfigs(
    EditGeneralConfigsParams params,
  );
}
