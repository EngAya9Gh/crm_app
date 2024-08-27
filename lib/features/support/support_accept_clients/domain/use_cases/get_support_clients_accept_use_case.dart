import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/support_clients_accept_repository.dart';

@lazySingleton
class GetSupportClientsAcceptUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetSupportClientsAcceptParams> {
  GetSupportClientsAcceptUseCase(this._repository);

  final SupportClientsAcceptRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetSupportClientsAcceptParams params,
  ) async {
    return await _repository.getClientsAccept(params);
  }
}

class GetSupportClientsAcceptParams {
  final int skip;
  final int limit;
  final String? filter;
  final List<RegionModel>? mainCities;

  const GetSupportClientsAcceptParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.mainCities,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': filter,
      ...ApiHelper.prepareParamsList(
        key: 'maincity',
        values: mainCities?.map((e) => e.id_maincity).toList() ?? [],
      ),
    };
  }
}
