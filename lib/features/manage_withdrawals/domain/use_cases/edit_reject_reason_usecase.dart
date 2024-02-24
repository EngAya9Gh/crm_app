import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../repositories/manage_withdrawals_repository.dart';
import 'add_reject_reason_usecase.dart';

@injectable
class EditRejectReasonsUsecase
    extends UseCase<Result<ResponseWrapper<String>>, ActionReasonParams> {
  EditRejectReasonsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<String>>> call(ActionReasonParams params) {
    return repository.editRejectReasons(params.params(), params.data());
  }
}
