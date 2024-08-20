import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/periodic_communication_type_enum.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/evaluation_level_report_repo.dart';

@lazySingleton
class GetEvaluationLevelReportUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetEvaluationLevelReportParams> {
  GetEvaluationLevelReportUsecase(this._repository);

  final EvaluationLevelReportRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetEvaluationLevelReportParams params,
  ) async {
    return await _repository.getEvaluationLevelReport(params);
  }
}

class GetEvaluationLevelReportParams {
  final String fkCountry;
  final PeriodicCommunicationTypeEnum periodicCommunicationType;
  final String? dateFrom;
  final String? dateTo;
  final double? rate;

  const GetEvaluationLevelReportParams({
    required this.fkCountry,
    required this.periodicCommunicationType,
    this.dateFrom,
    this.dateTo,
    this.rate,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'product': rate?.toInt(),
      'from': dateFrom,
      'to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');
  }

  Map<String, dynamic> toBody() {
    return {
      'type': "datedays",
    }..removeWhere((key, value) => value == null || value == '');
  }
}
