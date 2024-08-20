import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/greeting_communication_repo.dart';

@lazySingleton
class GetGreetingCommunicationUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetGreetingCommunicationParams> {
  GetGreetingCommunicationUseCase(this._repository);

  final GreetingCommunicationRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetGreetingCommunicationParams params,
  ) async {
    return await _repository.getGreetingCommunication(params);
  }
}

class GetGreetingCommunicationParams {
  final String fkCountry;
  final String type;
  final String? fkUser;

  const GetGreetingCommunicationParams({
    required this.fkCountry,
    required this.type,
    this.fkUser,
  });

  Map<String, dynamic> toParams() {
    return {
      'fkcountry': fkCountry,
      'type': type,
      'fk_user': fkUser,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
