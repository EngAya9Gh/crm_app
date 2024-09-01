import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/deleted_invoices_repo.dart';
import '../../domain/use_cases/get_deleted_invoices_usecase.dart';
import '../data_sources/deleted_invoices_datasource.dart';

@LazySingleton(as: DeletedInvoicesRepo)
class DeletedInvoicesRepoImpl implements DeletedInvoicesRepo {
  final DeletedInvoicesDatasource _dataSource;

  DeletedInvoicesRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getDeletedInvoices(
    GetDeletedParams params,
  ) async {
    try {
      final data = await _dataSource.getDeletedInvoices(params);

      return Right(data.copyWith(
        data: List<InvoiceModel>.from(
            data.data.map((e) => InvoiceModel.fromJson(e))),
      ));
    } catch (e) {
      debugPrint("error in getDeletedInvoices in repo => $e");
      return Left(e.toString());
    }
  }
}
