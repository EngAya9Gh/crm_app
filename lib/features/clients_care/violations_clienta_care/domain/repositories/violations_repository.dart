import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/get_violations_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';



abstract class ViolationsRepository {
  Future<Either<String, PaginationResponseWrapper>> getViolations(
      GetViolationsParams params,
      );
}
