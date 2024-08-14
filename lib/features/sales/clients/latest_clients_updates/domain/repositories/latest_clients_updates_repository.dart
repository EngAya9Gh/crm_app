import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_latest_clients_comments_usecase.dart';

abstract class LatestClientsUpdatesRepository {
  Future<Either<String, PaginationResponseWrapper>> getLatestClients(
    GetLatestClientsParams params,
  );
}
