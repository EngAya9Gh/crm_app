import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../repositories/verified_invoice_repo.dart';

@injectable
class GetVerifiedInvoiceUseCase extends BaseUsecase<Result<ResponseWrapper<List<InvoiceModel>>>, GetInvoicesByPrivilegesParams> {
  GetVerifiedInvoiceUseCase(this.repository);

  final VerifiedInvoiceRepository repository;

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> call(GetInvoicesByPrivilegesParams params) {
    return repository.getVerifiedInvoice(params);
  }
}
