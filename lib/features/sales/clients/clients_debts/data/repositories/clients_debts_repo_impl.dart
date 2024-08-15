import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/repositories/clients_debts_repo.dart';
import '../../domain/use_cases/get_clients_debts_usecase.dart';
import '../data_sources/clients_debts_datasource.dart';

@LazySingleton(as: ClientsDebtsRepo)
class ClientsDebtsRepoImpl implements ClientsDebtsRepo {
  final ClientsDebtsDatasource _dataSource;

  const ClientsDebtsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsDebts(
    GetClientsDebtsParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsDebts(params);
      return Right(response.copyWith(
        data: List<InvoiceModel>.from(
          response.data.map((e) => InvoiceModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsDebts in repo => $e");
      return Left(e.toString());
    }
  }
}
