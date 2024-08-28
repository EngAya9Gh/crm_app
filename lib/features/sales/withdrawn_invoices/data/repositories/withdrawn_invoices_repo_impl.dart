import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/withdrawn_invoices_repo.dart';
import '../../domain/use_cases/get_withdrawn_invoices_usecase.dart';
import '../data_sources/withdrawn_invoices_data_source.dart';

@LazySingleton(as: WithdrawnInvoicesRepo)
class WithdrawnInvoicesRepoImpl implements WithdrawnInvoicesRepo {
  final WithdrawnInvoicesDataSource _dataSource;

  WithdrawnInvoicesRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getWithdrawnInvoices(
    GetWithdrawnInvoicesParams params,
  ) async {
    try {
      final data = await _dataSource.getWithdrawnInvoices(params);

      return Right(data.copyWith(
        data: List<InvoiceModel>.from(
            data.data.map((e) => InvoiceModel.fromJson(e))),
      ));
    } catch (e) {
      debugPrint("error in getWithdrawnInvoices in repo => $e");
      return Left(e.toString());
    }
  }
}
