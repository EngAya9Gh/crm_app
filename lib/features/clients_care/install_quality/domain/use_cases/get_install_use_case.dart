import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/install_quality_type_enum.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/install_quality_repo.dart';

@lazySingleton
class GetInstallUseCase extends UseCase<
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
  final String fkCountry;
  final InstallQualityTypeEnum installQualityType;
  final String? fkUser;
  final String? dateFrom;
  final String? dateTo;

  const GetInstallParams({
    required this.fkCountry,
    required this.installQualityType,
    this.fkUser,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'fk_user': fkUser,
      'from': dateFrom,
      'to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
