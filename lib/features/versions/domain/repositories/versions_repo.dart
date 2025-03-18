import 'package:crm_smart/features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart';
import 'package:crm_smart/features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/data/models/incomming_update.dart';
import 'package:crm_smart/features/versions/domain/use_cases/add_demand_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../../../model/versionModel.dart';
import '../use_cases/add_version_usecase.dart';
import '../use_cases/get_versions_usecase.dart';

abstract class versionsRepo {
  Future<Either<String, PaginationResponseWrapper>> getVersions(
    GetVersionsParams params,
  );

  Future<Either<String, bool>> addVersion(AddVersionPramas params);
  Future<Result<ResponseWrapper<DemandModel>>> addDemand(AddDemandParams params);
  Future<Result<ResponseWrapper<List<DemandModel>>>> getDemands();
  Future<Either<String, ResponseWrapper<VersionModel>>> updateVersion(AddVersionPramas params);
  Future<Either<String, ResponseWrapper<IconmmingUpdateInfo>>> getIncommingUpdateInfo();
}
