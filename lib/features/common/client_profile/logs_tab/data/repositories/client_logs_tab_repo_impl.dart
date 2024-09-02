import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/client_logs_tab_repo.dart';
import '../../domain/use_cases/get_client_logs_usecase.dart';
import '../data_sources/client_logs_tab_data_source.dart';
import '../models/client_log_model.dart';

@LazySingleton(as: ClientLogsTabRepo)
class ClientLogsTabRepoImpl implements ClientLogsTabRepo {
  final ClientLogsTabDataSource _supportTabDataSource;

  ClientLogsTabRepoImpl(this._supportTabDataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientLogs(
    GetClientLogsParams params,
  ) async {
    try {
      final data = await _supportTabDataSource.getClientLogs(params);
      return Right(data.copyWith(
        data: List<ClientLogModel>.from(
          data.data.map((e) => ClientLogModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientLogs => $e");
      return Left(e.toString());
    }
  }
}
