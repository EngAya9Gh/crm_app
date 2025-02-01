import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/usermodel.dart';
import '../use_cases/export_invoices_to_pdf_usecase.dart';
import '../use_cases/get_all_users_usecase.dart';
import '../use_cases/get_invoices_by_privileges_usecase.dart';

abstract interface class InvoicesSectionRepo {
  Future<Either<String, dynamic>> getInvoiceByPrivileges(GetInvoicesByPrivilegesParams params);

  Future<Either<String, PaginationResponseWrapper>> exportToExcel(GetInvoicesByPrivilegesParams params);
  Future<Either<String, PaginationResponseWrapper>> exportToPdf(ExportInvoiceToPdfParams params);

  Future<Either<String, List<UserModel>>> getAllUsers(GetAllUsersParams params);

  Future<Either<String, PaginationResponseWrapper>> getInvoiceById(GetInvoiceByIdParams params);
}
