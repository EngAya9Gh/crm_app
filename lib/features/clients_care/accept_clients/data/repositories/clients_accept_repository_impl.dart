import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/clientmodel.dart';
import '../../domain/repositories/clients_accept_repository.dart';
import '../../domain/use_cases/get_clients_accept_usecase.dart';
import '../data_sources/clients_accept_datasource.dart';

@LazySingleton(as: ClientsAcceptRepository)
class ClientsAcceptRepositoryImpl implements ClientsAcceptRepository {
  final ClientsAcceptDatasource _dataSource;

  ClientsAcceptRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, List<ClientModel1>>> getClientsAccept(
    GetClientsAcceptParams params,
  ) async {
    try {
      final data = await _dataSource.getClientsAccept(params);
      final List<ClientModel1> clients = List<ClientModel1>.from(
        data.map((e) => ClientModel1.fromJson(e)),
      );
      return Right(clients);
    } catch (e) {
      debugPrint("error in getClientsAccept => $e");
      return Left(e.toString());
    }
  }
}
