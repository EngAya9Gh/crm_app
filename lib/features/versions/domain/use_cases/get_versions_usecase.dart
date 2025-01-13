import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/common/enums/notifications/notification_type_enum.dart';
import '../../../../core/utils/app_constants.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class GetVersionsUsecase extends BaseUsecase<Either<String, PaginationResponseWrapper>, GetVersionsParams> {
  GetVersionsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetVersionsParams params,
  ) async {
    return await _repository.getVersions(params);
  }
}

class GetVersionsParams {
  final String? query;
  final String? versionDate;
  final int? management;
  final String? versionNo;

  const GetVersionsParams({
     this.query,
     this.versionDate,
     this.management,
     this.versionNo,
  });

  Map<String, dynamic> toParams() {
    final Map<String, dynamic> map = {
      'version_date': versionDate,
      'management': management,
      'version_no': versionNo,
    }..removeWhere((key, value) => value == null || value == '');

    return {
      'filter': query,
      ...map,
    };
  }
}
