import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class GetDemandsUsecase extends BaseUsecase<Result<ResponseWrapper<List<DemandModel>>>, GetDemandParams> {
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
    this.page = 1,
    this.limit = 10,
  });

  GetDemandParams copyWith({
    String? status,
    int? user_id,
    int? management_id,
    String? filter,
    String? from,
    String? to,
    int? page,
    int? limit,
  }) {
    return GetDemandParams(
      status: status ?? this.status,
      user_id: user_id ?? this.user_id,
      management_id: management_id ?? this.management_id,
      filter: filter ?? this.filter,
      from: from ?? this.from,
      to: to ?? this.to,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'user_id': user_id,
      'filter': filter,
      'from': from,
      'to': to,
      'page': page,
      'limit': limit,
      if (management_id != null) 'management_id': management_id == 0 ? null : management_id,
    }..removeWhere((key, value) => (value == null || value == '') && key != 'management_id');
  }
}
