import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_periodic_communication_reports_usecase.dart';

abstract class PeriodicCommunicationReportsRepo {
  Future<Either<String, PaginationResponseWrapper>>
      getPeriodicCommunicationReports(
    GetPeriodicCommunicationReportsParams params,
  );
}
