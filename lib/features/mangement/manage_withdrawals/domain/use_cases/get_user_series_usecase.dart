import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/user_series.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetUserSeriesUsecase extends BaseUsecase<
    Result<ResponseWrapper<List<UserSeries>>>, GetUserSeriesParams> {
  GetUserSeriesUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> call(
      GetUserSeriesParams params) {
    return repository.getUsersSeries(params.toMap);
  }
}

class GetUserSeriesParams {
  GetUserSeriesParams(this.fkCountry);

  final String fkCountry;

  Map<String, dynamic> get toMap => {'fk_country': this.fkCountry};
}
