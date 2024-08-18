import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_periodic_communication_use_case.dart';

abstract class PeriodicCommunicationRepo {
  Future<Either<String, PaginationResponseWrapper>> getPeriodicCommunication(
    GetPeriodicCommunicationParams params,
  );
}
