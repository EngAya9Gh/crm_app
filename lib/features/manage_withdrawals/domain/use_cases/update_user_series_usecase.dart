import 'package:collection/collection.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/user_series.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class UpdateSeriesUsecase extends UseCase<
    Result<ResponseWrapper<List<UserSeries>>>, UpdateSeriesParams> {
  UpdateSeriesUsecase(this.repository);

  final ManageWithdrawalsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> call(
      UpdateSeriesParams params) {
    return repository.updateUsersSeries(params.toMap);
  }
}

class UpdateSeriesParams {
  UpdateSeriesParams(this.fkCountry, this.usersSeriesIds);

  final String fkCountry;
  final List<String> usersSeriesIds;

  Map<String, dynamic> get toMap {
    final map = {};
    usersSeriesIds
        .forEachIndexed((index, element) => map["fk_user[$index]"] = element);
    return {'fk_country': this.fkCountry, ...map};
  }
}
