import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/withdrawn_details_model.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetWithdrawnDetailsUsecase extends BaseUsecase<
    Result<ResponseWrapper<WithdrawnDetailsModel>>, GetWithdrawnDetailsParams> {
  GetWithdrawnDetailsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<WithdrawnDetailsModel>>> call(
      GetWithdrawnDetailsParams params) {
    return repository.getWithdrawnDetails(params.toMap);
  }
}

class GetWithdrawnDetailsParams {
  GetWithdrawnDetailsParams(this.fkInvoice);

  final String fkInvoice;

  Map<String, dynamic> get toMap => {"fk_invoice": fkInvoice};
}
