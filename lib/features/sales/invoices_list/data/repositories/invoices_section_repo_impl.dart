import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/export_invoices_to_pdf_usecase.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/usermodel.dart';
import '../../domain/repositories/invoices_section_repo.dart';
import '../../domain/use_cases/get_all_users_usecase.dart';
import '../../domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../data_sources/incoives_section_datasource.dart';

@LazySingleton(as: InvoicesSectionRepo)
class InvoicesTabRepoImpl implements InvoicesSectionRepo {
  final InvoicesTabDataSource _dataSource;

  InvoicesTabRepoImpl(this._dataSource);

  @override
  Future<Either<String, dynamic>> getInvoiceByPrivileges(
    GetInvoicesByPrivilegesParams params,
  ) {
    return _dataSource.getInvoiceByPrivileges(params);
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> exportToExcel(
    GetInvoicesByPrivilegesParams params,
  ) {
    return _dataSource.exportToExcel(params);
  }

  @override
  Future<Either<String, List<UserModel>>> getAllUsers(GetAllUsersParams params) async {
    try {
      final data = await _dataSource.getAllUsers(params);

      List<UserModel> usersList = List<UserModel>.from(data.map((e) => UserModel.fromJson(e)));

      return Right(usersList);
    } catch (e) {
      debugPrint("error in getAllUsers => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> getInvoiceById(GetInvoiceByIdParams params) async {
    try {
      final data = await _dataSource.getInvoiceById(params);
      return Right(data.copyWith(data: InvoiceModel.fromJson(data.data)));
    } catch (e) {
      debugPrint("error in getInvoiceById in repo => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> exportToPdf(ExportInvoiceToPdfParams params) {
    return _dataSource.exportToPdf(params);
  }
}
