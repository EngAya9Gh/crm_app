import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../domain/repositories/support_clients_accept_repository.dart';
import '../../domain/use_cases/get_support_clients_accept_use_case.dart';
import '../data_sources/support_clients_accept_datasource.dart';

@LazySingleton(as: SupportClientsAcceptRepository)
class SupportClientsAcceptRepositoryImpl
    implements SupportClientsAcceptRepository {
  final SupportClientsAcceptDatasource _dataSource;

  const SupportClientsAcceptRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsAccept(
    GetSupportClientsAcceptParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsAccept(params);
      return Right(response.copyWith(
        data: List<ClientModel>.from(
          response.data.map((e) => ClientModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsAccept => $e");
      return Left(e.toString());
    }
  }
}
