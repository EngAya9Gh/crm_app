import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/support_clients_invoices_repo.dart';
import '../../domain/use_cases/get_support_clients_invoices_use_case.dart';
import '../data_sources/support_clients_invoices_datasource.dart';

@LazySingleton(as: SupportClientsInvoicesRepo)
class SupportClientsInvoicesRepoImpl implements SupportClientsInvoicesRepo {
  final SupportClientsInvoicesDatasource _dataSource;

  const SupportClientsInvoicesRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getSupportClientInvoices(
    GetSupportClientsInvoicesParams params,
  ) async {
    try {
      final response = await _dataSource.getSupportClientInvoices(params);
      return Right(response.copyWith(
        data: List<InvoiceModel>.from(
          response.data.map((e) => InvoiceModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getSupportClientInvoices in repo => $e");
      return Left(e.toString());
    }
  }
}
