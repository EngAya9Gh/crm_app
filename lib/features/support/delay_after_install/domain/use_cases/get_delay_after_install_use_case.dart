import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/usermodel.dart';
import '../repositories/delay_after_install_repo.dart';

@lazySingleton
class GetDelayAfterInstallUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetDelayAfterInstallParams> {
  GetDelayAfterInstallUseCase(this._repository);

  final DelayAfterInstallRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetDelayAfterInstallParams params,
  ) async {
    return await _repository.getDelayAfterInstall(params);
  }
}

class GetDelayAfterInstallParams {
  final String fkCountry;
  final String type;
  final UserModel? employee;
  final String? dateFrom;
  final String? dateTo;

  const GetDelayAfterInstallParams({
    required this.fkCountry,
    required this.type,
    this.employee,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'id_user': employee?.idUser,
      'from': handleDate(dateFrom ?? ''),
      'to': handleDate(dateTo ?? ''),
    }..removeWhere((key, value) => value == null);
  }

  Map<String, dynamic> toBody() {
    return {
      'type': type,
    };
  }

  String? handleDate(String date) {
    if (date.isNotEmpty) {
      return date;
    }
    return HelperFunctions.formatDate(DateTime.now());
  }
}
