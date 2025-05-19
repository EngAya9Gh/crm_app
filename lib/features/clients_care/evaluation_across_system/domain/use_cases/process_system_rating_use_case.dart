import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/elevation_model.dart';
import '../repositories/sys_support_rating_repo.dart';

@lazySingleton
class ProcessSystemRatingUseCase extends BaseUsecase<
    Result<ResponseWrapper<ElevationModel>>, ProcessSystemRatingParams> {
  ProcessSystemRatingUseCase(this._repository);

  final ElevationAcrossSystemRepo _repository;

  @override
  Future<Result<ResponseWrapper<ElevationModel>>> call(
    ProcessSystemRatingParams params,
  ) async {
    return await _repository.processSystemRating(params);
  }
}

class ProcessSystemRatingParams {
  final int ratingId;
  final String comment;

  const ProcessSystemRatingParams({
    required this.ratingId,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'comment': this.comment,
    };
  }
}
