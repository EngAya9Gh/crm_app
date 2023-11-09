import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetRejectReasonsUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<RejectReason>>>> {
  GetRejectReasonsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<RejectReason>>>> call() {
    return repository.getRejectReasons();
  }
}
