import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/clientmodel.dart';
import '../../domain/repositories/clients_accept_repository.dart';
import '../../domain/use_cases/get_clients_accept_usecase.dart';
import '../data_sources/clients_accept_datasource.dart';

@LazySingleton(as: ClientsAcceptRepository)
class ClientsAcceptRepositoryImpl implements ClientsAcceptRepository {
  final ClientsAcceptDatasource _dataSource;

  ClientsAcceptRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsAccept(
    GetClientsAcceptParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsAccept(params);
      return Right(response.copyWith(
        data: List<ClientModel1>.from(
          response.data.map((e) => ClientModel1.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsAccept => $e");
      return Left(e.toString());
    }
  }
}
