import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/communication/quality_type_enum.dart';
import '../../../../../core/common/enums/install_quality_type_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/install_quality_repo.dart';

@lazySingleton
class GetInstallUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetInstallParams> {
  GetInstallUseCase(this._repository);

  final InstallQualityRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetInstallParams params,
  ) async {
    return await _repository.getInstall(params);
  }
}

class GetInstallParams {
  final int skip;
  final int limit;
  final InstallQualityTypeEnum installQualityType;
  final String? filter;
  final String? fkUser;
  final String? fkRegion;
  final QualityTypeEnum? status;
  final String? dateFrom;
  final String? dateTo;

  const GetInstallParams({
    required this.installQualityType,
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.fkUser,
    this.fkRegion,
    this.status,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': filter,
      'fk_user': fkUser,
      'fk_regoin': fkRegion,
      'status': status?.toParam(),
      'from': dateFrom,
      'to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
