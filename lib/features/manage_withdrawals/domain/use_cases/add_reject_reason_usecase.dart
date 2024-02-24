import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class AddRejectReasonsUsecase
    extends UseCase<Result<ResponseWrapper<String>>, ActionReasonParams> {
  AddRejectReasonsUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<String>>> call(ActionReasonParams params) {
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
