import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/repositories/finance_pending_repo.dart';
import '../../domain/use_cases/get_finance_pending_invoices_usecase.dart';
import '../data_sources/finance_pending_datasource.dart';

@LazySingleton(as: FinancePendingRepo)
class FinancePendingRepoImpl implements FinancePendingRepo {
  final FinancePendingDatasource _dataSource;

  const FinancePendingRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getFinancePendingInvoices(
    GetFinancePendingInvoicesParams params,
  ) async {
    try {
      final response = await _dataSource.getFinancePendingInvoices(params);
      return Right(response.copyWith(
        data: List<InvoiceModel>.from(
          response.data.map((e) => InvoiceModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getApproveFinanceInvoices in repo => $e");
      return Left(e.toString());
    }
  }
}
