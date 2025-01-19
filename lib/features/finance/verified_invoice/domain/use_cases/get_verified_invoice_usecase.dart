import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../repositories/clients_attachments_repo.dart';

@injectable
class GetVerifiedInvoiceUseCase extends UseCaseNoParam<Either<String, List<InvoiceModel>>> {
  GetVerifiedInvoiceUseCase(this.repository);

  final VerifiedInvoiceRepository repository;

  @override
  Future<Either<String, List<InvoiceModel>>> call() {
    return repository.getVerifiedInvoice();
  }
}

