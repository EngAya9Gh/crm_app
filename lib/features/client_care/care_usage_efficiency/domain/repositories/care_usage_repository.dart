import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../entities/care_usage.dart';
import '../../../../../core/errors/failures.dart';
import '../../data/models/care_usage_model.dart';
import '../usecases/get_care_usage_list.dart';

abstract class CareUsageRepository {
  Future<Either<String, PaginationResponseWrapper>> getCareUsageList({
    int? skip,
    String? filter,
    String? endFrom,
    String? endTo,
    String? startFrom,
    String? startTo,
    String? lastActivityFrom,
    String? lastActivityTo,
    String? state,
    String? premium,
    String? package,
    int? fkRegoin,
    int? activityTypeFk,
    int? shouldCommunicate,
  });

  Future<Either<String, CareUsageModel>> doneCommunication(
      int communicationId);
}
