import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/invoices_section_repo.dart';
import 'get_invoices_by_privileges_usecase.dart';

@lazySingleton
class ExportInvoicesToExcelUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetInvoicesByPrivilegesParams> {
  ExportInvoicesToExcelUsecase(this._repository);

  final InvoicesSectionRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetInvoicesByPrivilegesParams params,
  ) async {
    return await _repository.exportToExcel(params);
  }
}
