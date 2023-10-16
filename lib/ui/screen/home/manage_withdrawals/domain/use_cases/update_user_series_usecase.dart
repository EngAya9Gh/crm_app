import 'package:collection/collection.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/ui/screen/home/manage_withdrawals/data/models/user_series.dart';
import 'package:crm_smart/ui/screen/home/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../common/models/response_wrapper/response_wrapper.dart';

@injectable
class UpdateSeriesUsecase extends UseCase<Result<ResponseWrapper<List<UserSeries>>>, UpdateSeriesParams> {
  UpdateSeriesUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> call(UpdateSeriesParams params) {
    return repository.updateUsersSeries(params.toMap);
  }
}

class UpdateSeriesParams {
  UpdateSeriesParams(this.fkCountry, this.usersSeriesIds);

  final String fkCountry;
  final List<String> usersSeriesIds;

  Map<String, dynamic> get toMap {
    final map = {};
    usersSeriesIds.forEachIndexed((index, element) => map["fk_user[$index]"] = element);
    return {'fk_country': this.fkCountry, ...map};
  }
}
