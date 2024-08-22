import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_install_reports_repo.dart';

@lazySingleton
class GetClientsInstallReportsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetClientsInstallReportsParams> {
  GetClientsInstallReportsUsecase(this._repository);

  final ClientsInstallReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsInstallReportsParams params,
  ) async {
    return await _repository.getClientsInstallReports(params);
  }
}

class GetClientsInstallReportsParams {
  final ReportTypeEnum type;
  final bool? isMarketing;
  final String? dateFrom;
  final String? dateTo;

  const GetClientsInstallReportsParams({
    required this.type,
    this.isMarketing,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'ismarketing': isMarketing == true ? 1 : null,
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
