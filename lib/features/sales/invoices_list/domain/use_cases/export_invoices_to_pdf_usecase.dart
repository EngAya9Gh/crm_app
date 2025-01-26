import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/invoices_section_repo.dart';
import 'get_invoices_by_privileges_usecase.dart';

@lazySingleton
class ExportInvoicesToPdfUsecase extends BaseUsecase<Either<String, PaginationResponseWrapper>, ExportInvoiceToPdfParams> {
  ExportInvoicesToPdfUsecase(this._repository);

  final InvoicesSectionRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(ExportInvoiceToPdfParams params) async {
    return await _repository.exportToPdf(params);
  }
}

class ExportInvoiceToPdfParams {
  final String invoiceId;
  final bool download;

  const ExportInvoiceToPdfParams({
    required this.invoiceId,
    this.download=true,
  });

  Map<String, dynamic> toMap() {
    return {
      'download': this.download,
    };
  }
}
