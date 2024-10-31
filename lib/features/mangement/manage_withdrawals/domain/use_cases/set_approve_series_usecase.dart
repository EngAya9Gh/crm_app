import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/withdrawal_status_enum.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class SetApproveSeriesUsecase
    extends BaseUsecase<Result<ResponseWrapper<bool>>, SetApproveSeriesParams> {
  SetApproveSeriesUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(
      SetApproveSeriesParams seriesParams) {
    return repository.setApproveSeries(seriesParams.param, seriesParams.data);
  }
}

class SetApproveSeriesParams {
  SetApproveSeriesParams({
    required this.idApproveSeries,
    required this.invoiceId,
    required this.withdrawalStatus,
    required this.clientId,
    required this.nameEnterprise,
    required this.nameUserdo,
    required this.fkcountry,
    required this.fk_regoin,
    required this.id_user,
    required this.notesApprove,
    required this.fkRequest,
  });

  final String idApproveSeries;
  final String invoiceId;

  final WithdrawalStatus withdrawalStatus;
  final String clientId;
  final String id_user;
  final String nameEnterprise;
  final String nameUserdo;
  final String fk_regoin;
  final String fkcountry;
  final String fkRequest;
  final String notesApprove;

  Map<String, dynamic> get param =>
      {"idApprove_series": idApproveSeries, "fk_invoice": invoiceId};

  Map<String, dynamic> get data => {
        "is_approve": withdrawalStatus.status.toString(),
        "fk_client": clientId,
        "name_enterprise": nameEnterprise,
        "nameUserdo": nameUserdo,
        "fkcountry": fkcountry,
        "fk_regoin": fk_regoin,
        "notes_approve": notesApprove,
        "fk_request": fkRequest,
      };
}
