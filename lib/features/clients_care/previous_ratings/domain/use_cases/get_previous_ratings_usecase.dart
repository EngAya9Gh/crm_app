import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/previous_ratings_type_enum.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/previous_ratings_repo.dart';

@lazySingleton
class GetPreviousRatingsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetPreviousRatingsParams> {
  GetPreviousRatingsUsecase(this._repository);

  final PreviousRatingsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPreviousRatingsParams params,
  ) async {
    return await _repository.getPreviousRatings(params);
  }
}

class GetPreviousRatingsParams {
  final int skip;
  final int limit;
  final PreviousRatingsTypeEnum typeCommunication;
  final String? fkUser;
  final String? userInstall;
  final bool? starClient;

  const GetPreviousRatingsParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    required this.typeCommunication,
    this.fkUser,
    this.userInstall,
    this.starClient,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'type_communication': typeCommunication.toParam,
      'fk_user': fkUser,
      'user_install': userInstall,
      if (starClient == true) 'star_client': 1,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
