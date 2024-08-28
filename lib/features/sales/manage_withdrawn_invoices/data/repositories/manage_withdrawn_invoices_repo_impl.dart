import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/manage_withdrawn_invoices_repo.dart';
import '../../domain/use_cases/get_manage_withdrawn_invoices_usecase.dart';
import '../data_sources/manage_withdrawn_invoices_data_source.dart';

@LazySingleton(as: ManageWithdrawnInvoicesRepo)
class ManageWithdrawnInvoicesRepoImpl implements ManageWithdrawnInvoicesRepo {
  final ManageWithdrawnInvoicesDataSource _dataSource;

  ManageWithdrawnInvoicesRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getManageWithdrawnInvoices(
    GetManageWithdrawnInvoicesParams params,
  ) async {
    try {
      final data = await _dataSource.getManageWithdrawnInvoices(params);

      return Right(data.copyWith(
        data: List<InvoiceModel>.from(
            data.data.map((e) => InvoiceModel.fromJson(e))),
      ));
    } catch (e) {
      debugPrint("error in getManageWithdrawnInvoices in repo => $e");
      return Left(e.toString());
    }
  }
}
