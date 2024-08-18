import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/periodic_communication_type_enum.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/periodic_communication_repo.dart';

@lazySingleton
class GetPeriodicCommunicationUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetPeriodicCommunicationParams> {
  GetPeriodicCommunicationUseCase(this._repository);

  final PeriodicCommunicationRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPeriodicCommunicationParams params,
  ) async {
    return await _repository.getPeriodicCommunication(params);
  }
}

class GetPeriodicCommunicationParams {
  final String fkCountry;
  final PeriodicCommunicationTypeEnum periodicCommunicationType;
  final String? fkUser;
  final String? dateFrom;
  final String? dateTo;
  final double? rate;

  const GetPeriodicCommunicationParams({
    required this.fkCountry,
    required this.periodicCommunicationType,
    this.fkUser,
    this.dateFrom,
    this.dateTo,
    this.rate,
  });

  Map<String, dynamic> toParams() {
    final Map<String, dynamic> params = {
      'fk_country': fkCountry,
      'fk_user': fkUser,
    };

    if (periodicCommunicationType.isEvaluated) {
      params.addAll({
        'product': rate?.toInt(),
        'from': HelperFunctions.dateFromString(dateFrom).toString(),
        'to': HelperFunctions.dateFromString(dateTo).toString(),
      });
    }
    return params..removeWhere((key, value) => value == null || value == '');
  }

  Map<String, dynamic> toBody() {
    return {
      'type': "datedays",
    }..removeWhere((key, value) => value == null || value == '');
  }
}
