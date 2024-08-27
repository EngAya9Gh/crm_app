import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/communication/greeting_type_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/greeting_communication_repo.dart';

@lazySingleton
class GetGreetingCommunicationUseCase extends BaseUsecase<
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
  final int skip;
  final int limit;
  final String? filter;
  final String? fkUser;
  final String? fkRegion;
  final GreetingTypeEnum? status;
  final String? from;
  final String? to;

  const GetGreetingCommunicationParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.fkUser,
    this.fkRegion,
    this.status,
    this.from,
    this.to,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': filter,
      'fk_regoin': fkRegion,
      'status': status?.toParam(),
      'from': from,
      'to': to,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
