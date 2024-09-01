import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/client_logs_tab_repo.dart';

@lazySingleton
class GetClientLogsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetClientLogsParams> {
  GetClientLogsUsecase(this._repository);

  final ClientLogsTabRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientLogsParams params,
  ) async {
    return await _repository.getClientLogs(params);
  }
}

class GetClientLogsParams {
  final String idClient;

  const GetClientLogsParams({
    required this.idClient,
  });
}
