import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class GetDemandsUsecase extends BaseUsecase<Result<ResponseWrapper<List<DemandModel>>>,GetDemandParams> {
  GetDemandsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<DemandModel>>>> call(GetDemandParams params) async {
    return await _repository.getDemands(params);
  }
}

class GetDemandParams {
  final String? status;
  final int? user_id;
  final int? management_id;
  final String? filter;
  final String? from;
  final String? to;
  final int page;
  final int limit;

  const GetDemandParams({
    this.status,
    this.user_id,
    this.management_id,
    this.filter,
    this.from,
    this.to,
    this.page=1,
    this.limit=10,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'user_id': user_id,
      'filter': filter,
      'from': from,
      'to': to,
      'page': page,
      'limit': limit,
      'management_id': management_id,
    }..removeWhere((key, value) => value == null && key != 'management_id');
  }


}
