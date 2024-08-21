import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/periodic_communication_reports_repo.dart';

@lazySingleton
class GetPeriodicCommunicationReportsUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>,
    GetPeriodicCommunicationReportsParams> {
  GetPeriodicCommunicationReportsUsecase(this._repository);

  final PeriodicCommunicationReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPeriodicCommunicationReportsParams params,
  ) async {
    return await _repository.getPeriodicCommunicationReports(params);
  }
}

class GetPeriodicCommunicationReportsParams {
  final String fkCountry;
  final String? dateFrom;
  final String? dateTo;

  const GetPeriodicCommunicationReportsParams({
    required this.fkCountry,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'from': dateFrom,
      'to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
