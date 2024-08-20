import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_care_reports_usecase.dart';

abstract class ClientsCareReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientsCareReports(
    GetClientsCareReportsParams params,
  );
}
