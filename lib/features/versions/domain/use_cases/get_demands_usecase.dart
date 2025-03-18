import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class GetDemandsUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<DemandModel>>>> {
  GetDemandsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<DemandModel>>>> call() async {
    return await _repository.getDemands();
  }
}
