import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/periodic_communication_type_enum.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/periodic_communication_repo.dart';

@lazySingleton
class GetPeriodicCommunicationUseCase extends BaseUsecase<Either<String, PaginationResponseWrapper>, GetPeriodicCommunicationParams> {
  GetPeriodicCommunicationUseCase(this._repository);

  final PeriodicCommunicationRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPeriodicCommunicationParams params,
  ) async {
    return await _repository.getPeriodicCommunication(params);
  }
}

class GetPeriodicCommunicationParams {
  final int skip;
  final int limit;
  final String? filter;
  final PeriodicCommunicationTypeEnum periodicCommunicationType;
  final String? fkUser;
  final String? fkRegion;
  final String? dateFrom;
  final String? dateTo;
  final String? type;
  final double? rate;
  final int clientWhoNotRate;

  const GetPeriodicCommunicationParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    required this.periodicCommunicationType,
    this.fkUser,
    this.fkRegion,
    this.dateFrom,
    this.dateTo,
    this.rate,
    this.type,
    this.clientWhoNotRate=0,
  });

  Map<String, dynamic> toParams() {
    final Map<String, dynamic> params = {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'fk_user': fkUser,
      'filter': filter,
     if(clientWhoNotRate!=0) 'not_rated':clientWhoNotRate,
    };

    if (periodicCommunicationType.isEvaluated) {
      params.addAll({
        'type': "datedays",
        'rate': rate?.toInt(),
        'from': dateFrom,
        'to': dateTo,
      });
    }

    if (periodicCommunicationType.isWaiting) {
      params.addAll({'fk_regoin': fkRegion, if (type != null && type != 'null') 'type': type});
    }

    return params..removeWhere((key, value) => value == null || value == '');
  }
}
