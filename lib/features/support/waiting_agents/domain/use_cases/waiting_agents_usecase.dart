import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../repositories/waiting_agents_repo.dart';

@lazySingleton
class GetWaitingAgentsUsecase extends BaseUsecase<Either<String, ResponseWrapper<List<AgentDistributorModel>>>, GetWaitingAgentsParams> {
  GetWaitingAgentsUsecase(this._repository);

  final WaitingAgentsRepo _repository;

  @override
  Future<Either<String, ResponseWrapper<List<AgentDistributorModel>>>> call(
    GetWaitingAgentsParams params,
  ) async {
    return await _repository.getWaitingAgents(params);
  }
}

class GetWaitingAgentsParams {
  final int page;
  final int? limit;
  final String? filter;
  final String? source;

  const GetWaitingAgentsParams({
    this.page = 1,
    this.limit = 20,
    this.filter,
    this.source,
  });

  bool isEmpty() {
    return (source?.isEmpty ?? true);
  }

  Map<String, dynamic> toMap() {
    return {
      'page': this.page,
      'limit': this.limit,
      'filter': this.filter,
      'source': this.source,
    }..removeWhere(
        (key, value) => value == null || value == '',
      );
  }

  GetWaitingAgentsParams copyWith({
    int? page,
    int? limit,
    ValueGetter<String?>? filter,
    ValueGetter<String?>? source,
  }) {
    return GetWaitingAgentsParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      filter: filter != null ? filter() : this.filter,
      source: source != null ? source() : this.source,
    );
  }
}
