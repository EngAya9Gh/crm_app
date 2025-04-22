import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/sys_support_rating_repo.dart';
import '../../domain/use_cases/get_elevation_sys_support_use_case.dart';
import '../data_sources/sys_support_rating_datasource.dart';
import '../models/elevation_model.dart';

@LazySingleton(as: ElevationAcrossSystemRepo)
class ElevationAcrossSystemRepoImpl implements ElevationAcrossSystemRepo {
  final ElevationAcrossSystemDatasource _dataSource;

  const ElevationAcrossSystemRepoImpl(this._dataSource);

  @override
  Future<Result<ResponseWrapper<List<ElevationModel>>>> getRating(GetRatingParams params) {
    return toApiResult(() async => _dataSource.getRating(params));
  }
}
