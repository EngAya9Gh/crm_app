import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_status_reports_usecase.dart';

abstract class ClientsStatusReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientsStatusReports(
    GetClientsStatusReportsParams params,
  );
}
