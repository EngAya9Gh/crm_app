import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../core/services/api/result.dart';
import '../../domain/repositories/app_repository.dart';
import '../data_sources/app_datasource.dart';
import '../models/update_config.dart';

@Injectable(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl(this._datasource);

  final AppDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<List<UpdateConfig>>>> getVersions() {
    return toApiResult(_datasource.getVersion);
  }
}
