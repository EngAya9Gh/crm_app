import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../presentation/utils/withdrawal_status.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class SetApproveSeriesUsecase extends UseCase<Result<ResponseWrapper<bool>>, SetApproveSeriesParams> {
  SetApproveSeriesUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(SetApproveSeriesParams seriesParams) {
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

  Map<String, dynamic> get param => {"idApprove_series": idApproveSeries, "fk_invoice": invoiceId};

  Map<String, dynamic> get data => {
        "is_approve": withdrawalStatus.status.toString(),
        "fk_client": clientId,
        "name_enterprise": nameEnterprise,
        "nameUserdo": nameUserdo,
        "fkcountry": fkcountry,
        "fk_regoin": fk_regoin,


      };
}
