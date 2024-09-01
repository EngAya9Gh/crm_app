import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_client_logs_usecase.dart';

abstract interface class ClientLogsTabRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientLogs(
    GetClientLogsParams params,
  );
}
