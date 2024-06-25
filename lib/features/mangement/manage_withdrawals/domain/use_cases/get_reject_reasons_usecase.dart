import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/models/reject_reason.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetRejectReasonsUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<List<RejectReason>>>> {
  GetRejectReasonsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<RejectReason>>>> call() {
    return repository.getRejectReasons();
  }
}
