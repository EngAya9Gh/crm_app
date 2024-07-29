import 'package:crm_smart/features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../domain/repositories/exceeded_clients_repo.dart';
import '../../domain/use_cases/exceeded_clients_use_case.dart';
import '../data_sources/exceeded_clients_datasource.dart';

@LazySingleton(as: ExceededClientsRepo)
class ExceededClientsRepoImpl implements ExceededClientsRepo {
  final ExceededClientsDatasource _dataSource;

  const ExceededClientsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getExceededClients(
    ExceededClientsParams params,
  ) async {
    try {
      final response = await _dataSource.getExceededClients(params);
      return Right(response.copyWith(
        data: List<ClientModel>.from(
          response.data.map((e) => ClientModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getExceededClients: $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> transferExceededClients(
    TransferExceededClientsParams params,
  ) async {
    try {
      final response = await _dataSource.transferExceededClients(params);
      return Right(response);
    } catch (e) {
      debugPrint("error in transferExceededClients: $e");
      return Left(e.toString());
    }
  }
}
