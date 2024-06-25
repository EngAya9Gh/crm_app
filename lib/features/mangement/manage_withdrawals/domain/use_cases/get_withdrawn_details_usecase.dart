import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/models/withdrawn_details_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetWithdrawnDetailsUsecase extends UseCase<
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
