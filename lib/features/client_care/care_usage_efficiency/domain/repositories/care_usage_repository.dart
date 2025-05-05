import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../entities/care_usage.dart';

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
}
