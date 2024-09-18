import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/invoices_section_repo.dart';

@lazySingleton
class GetInvoiceByIdUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetInvoiceByIdParams> {
  GetInvoiceByIdUsecase(this._repository);

  final InvoicesSectionRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetInvoiceByIdParams params,
  ) async {
    return await _repository.getInvoiceById(params);
  }
}

class GetInvoiceByIdParams {
  final String id;

  GetInvoiceByIdParams({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_invoice': id,
    };
  }
}
