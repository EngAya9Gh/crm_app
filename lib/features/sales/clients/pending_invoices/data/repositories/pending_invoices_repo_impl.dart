import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/repositories/pending_invoices_repo.dart';
import '../../domain/use_cases/get_pending_invoices_usecase.dart';
import '../data_sources/pending_invoices_datasource.dart';

@LazySingleton(as: PendingInvoicesRepo)
class PendingInvoicesRepoImpl implements PendingInvoicesRepo {
  final PendingInvoicesDatasource _dataSource;

  const PendingInvoicesRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getPendingInvoices(
    GetPendingInvoicesParams params,
  ) async {
    try {
      final response = await _dataSource.getPendingInvoices(params);
      return Right(response.copyWith(
        data: List<InvoiceModel>.from(
          response.data.map((e) => InvoiceModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getPendingInvoices in repo => $e");
      return Left(e.toString());
    }
  }
}
