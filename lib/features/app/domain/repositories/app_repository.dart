import '../../../../core/api/result.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/update_config.dart';

abstract class AppRepository {
  Future<Result<ResponseWrapper<List<UpdateConfig>>>> getVersions();
}
