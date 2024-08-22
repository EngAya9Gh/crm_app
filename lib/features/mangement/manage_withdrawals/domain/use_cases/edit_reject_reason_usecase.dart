import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../repositories/manage_withdrawals_repository.dart';
import 'add_reject_reason_usecase.dart';

@injectable
class EditRejectReasonsUsecase
    extends BaseUsecase<Result<ResponseWrapper<String>>, ActionReasonParams> {
  EditRejectReasonsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<String>>> call(ActionReasonParams params) {
    return repository.editRejectReasons(params.params(), params.data());
  }
}
