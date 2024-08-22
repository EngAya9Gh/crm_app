import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/enums/reports/care_report_type_enum.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_care_reports_repo.dart';

@lazySingleton
class GetClientsCareReportsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetClientsCareReportsParams> {
  GetClientsCareReportsUsecase(this._repository);

  final ClientsCareReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsCareReportsParams params,
  ) async {
    return await _repository.getClientsCareReports(params);
  }
}

class GetClientsCareReportsParams {
  final String fkCountry;
  final ReportTypeEnum type;
  final CareReportTypeEnum? typeCare;
  final String? dateFrom;
  final String? dateTo;

  const GetClientsCareReportsParams({
    required this.fkCountry,
    required this.type,
    this.typeCare,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'product': typeCare?.toParam,
      ..._prepareDateParams(),
    }..removeWhere((key, value) => value == null || value == '');
  }

  Map<String, dynamic> _prepareDateParams() {
    switch (type) {
      case ReportTypeEnum.dateYear:
        return {'year': dateFrom};
      case ReportTypeEnum.dateMonth:
        return {'month': "1-$dateFrom"};
      case ReportTypeEnum.dateDays:
        return {
          'from': dateFrom,
          'to': dateTo,
        };
      default:
        return {
          'month': dateFrom,
        };
    }
  }

  Map<String, dynamic> toBody() {
    return {
      'type': type.toParam,
    };
  }
}
