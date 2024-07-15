import 'package:crm_smart/features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/config_model.dart';
import '../use_cases/get_advanced_configs_usecase.dart';

abstract class AdvancedConfigsRepository {
  Future<Either<String, List<ConfigModel>>> getAdvancedConfigs(
    GetAdvancedConfigsParams params,
  );

  Future<Either<String, dynamic>> editAdvancedConfigs(
    EditAdvancedConfigsParams params,
  );
}
