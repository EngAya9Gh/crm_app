import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/app/data/data_sources/app_datasource.dart';
import 'package:crm_smart/features/app/data/models/update_config.dart';
import 'package:crm_smart/features/app/domain/repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl(this._datasource);

  final AppDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<List<UpdateConfig>>>> getVersions() {
    return toApiResult(_datasource.getVersion);
  }
}
