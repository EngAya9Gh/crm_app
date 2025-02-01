import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../data/models/verified_client_model.dart';
import '../repositories/verified_client_repo.dart';


@injectable
class GetVerifiedClientUseCase extends BaseUsecase<Result<ResponseWrapper<List<VerifiedClientModel>>>, GetInvoicesByPrivilegesParams> {
  GetVerifiedClientUseCase(this.repository);

  final VerifiedClientRepository repository;

  @override
  Future<Result<ResponseWrapper<List<VerifiedClientModel>>>> call(GetInvoicesByPrivilegesParams params) {
    return repository.getVerifiedClient(params);
  }
}
