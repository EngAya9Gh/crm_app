import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_evaluation_level_report_usecase.dart';

abstract class EvaluationLevelReportRepo {
  Future<Either<String, PaginationResponseWrapper>> getEvaluationLevelReport(
    GetEvaluationLevelReportParams params,
  );
}
