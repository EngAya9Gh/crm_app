import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/recommended_client_model.dart';
import '../use_cases/get_recommended_client_reports_usecase.dart';

abstract class RecommendedClientsReportsRepo {
  Future<Result<ResponseWrapper<List<RecommendClientsReports>>>> getRecommendClientsReports();
}
