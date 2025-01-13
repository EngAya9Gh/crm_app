import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/reject_reason.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class AddRejectReasonsUsecase
    extends BaseUsecase<Result<ResponseWrapper<RejectReason>>, ActionReasonParams> {
  AddRejectReasonsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<RejectReason>>> call(ActionReasonParams params) {
    return repository.addRejectReasons(params.data());
  }
}

class ActionReasonParams {
  final String name;
  final String? reasonRejectId;

  ActionReasonParams({
    required this.name,
    this.reasonRejectId,
  });

  Map<String, dynamic> data() => {'NameReason_reject': this.name};

  Map<String, dynamic> params() => {'id_rejectClient': this.reasonRejectId};
}
