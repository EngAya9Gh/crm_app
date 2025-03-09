import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/recommended_client/data/models/recommended_client_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/enums/reports/care_report_type_enum.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/recommended_client_reports_repo.dart';

@lazySingleton
class GetRecommendClientsReportsUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<RecommendClientsReports>>>> {
  GetRecommendClientsReportsUsecase(this._repository);

  final RecommendedClientsReportsRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<RecommendClientsReports>>>> call() async {
    return await _repository.getRecommendClientsReports();
  }
}
