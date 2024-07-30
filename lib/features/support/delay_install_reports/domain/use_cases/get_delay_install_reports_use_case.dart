import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/usermodel.dart';
import '../repositories/delay_install_reports_repo.dart';

@lazySingleton
class GetDelayInstallReportsUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetDelayInstallReportsParams> {
  GetDelayInstallReportsUseCase(this._repository);

  final DelayInstallReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetDelayInstallReportsParams params,
  ) async {
    return await _repository.getDelayInstallReports(params);
  }
}

class GetDelayInstallReportsParams {
  final String fkCountry;
  final String type;
  final UserModel? employee;

  const GetDelayInstallReportsParams({
    required this.fkCountry,
    required this.type,
    this.employee,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'id_user': employee?.idUser,
    }..removeWhere((key, value) => value == null);
  }

  Map<String, dynamic> toBody() {
    return {
      'type': type,
    };
  }
}
