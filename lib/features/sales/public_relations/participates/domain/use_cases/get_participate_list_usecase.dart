import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_helper.dart';
import '../../../../../../core/common/models/participate_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class ParticipateListUsecase extends BaseUsecase<
    Result<ResponseWrapper<List<ParticipateModel>>>, GetParticipateListParams> {
  ParticipateListUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> call(
    GetParticipateListParams params,
  ) {
    return repository.getParticipateList(params.toMap());
  }
}

class GetParticipateListParams {
  final int skip;
  final int? limit;
  final String? searchQuery;
  final String? fkCity;
  final String? stateParticipate;

  const GetParticipateListParams({
    this.skip = 0,
    this.limit,
    this.searchQuery,
    this.fkCity,
    this.stateParticipate,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit ?? 15,
      'filter': searchQuery,
      'fk_city': fkCity,
      'state_participate': stateParticipate,
    }..removeWhere((key, value) {
        return value == null || value == '';
      });
  }
}
