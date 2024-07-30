import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/maincitymodel.dart';
import '../repositories/support_clients_accept_repository.dart';

@lazySingleton
class GetSupportClientsAcceptUseCase extends UseCase<
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
  final String fkCountry;
  final List<MainCityModel>? mainCitiesIds;

  const GetSupportClientsAcceptParams({
    required this.fkCountry,
    this.mainCitiesIds,
  });

  String toUrl() {
    if (mainCitiesIds?.isEmpty ?? true) return '';
    String params = '';
    for (int i = 0; i < mainCitiesIds!.length; i++) {
      params += '&maincity[]=${mainCitiesIds![i].id_maincity}';
    }
    return params;
  }
}
