import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/domain/use_cases/change_demand_status_usecase.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class AddDemandCommentUsecase extends BaseUsecase<Result<ResponseWrapper<CommentModel>>, DemandChangeStatusOrCommentParams> {
  AddDemandCommentUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Result<ResponseWrapper<CommentModel>>> call(DemandChangeStatusOrCommentParams params) async {
    return await _repository.addDemandComment(params);
  }
}
