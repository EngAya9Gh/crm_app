import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
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
  final int skip;
  final int limit;
  final String? filter;
  final String? from;
  final String? to;

  const GetClientLogsParams({
    required this.idClient,
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.from,
    this.to,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'from': from,
      'to': to,
    };
  }
}
