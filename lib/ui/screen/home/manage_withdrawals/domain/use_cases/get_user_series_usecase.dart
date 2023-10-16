import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/ui/screen/home/manage_withdrawals/data/models/user_series.dart';
import 'package:crm_smart/ui/screen/home/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../common/models/response_wrapper/response_wrapper.dart';

@injectable
class GetUserSeriesUsecase extends UseCase<Result<ResponseWrapper<List<UserSeries>>>, GetUserSeriesParams> {
  GetUserSeriesUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> call(GetUserSeriesParams params) {
    return repository.getUsersSeries(params.toMap);
  }
}

class GetUserSeriesParams {
  GetUserSeriesParams(this.fkCountry);

  final String fkCountry;

  Map<String, dynamic> get toMap => {'fk_country': this.fkCountry};
}
