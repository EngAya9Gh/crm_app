import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_greeting_communication_use_case.dart';

abstract class GreetingCommunicationRepo {
  Future<Either<String, PaginationResponseWrapper>> getGreetingCommunication(
    GetGreetingCommunicationParams params,
  );
}
