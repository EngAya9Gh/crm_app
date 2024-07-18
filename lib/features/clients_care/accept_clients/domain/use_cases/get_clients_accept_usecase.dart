import 'package:crm_smart/core/common/helpers/calculate_page.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/clients_accept_repository.dart';

@lazySingleton
class GetClientsAcceptUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetClientsAcceptParams> {
  GetClientsAcceptUseCase(this._repository);

  final ClientsAcceptRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsAcceptParams params,
  ) async {
    return await _repository.getClientsAccept(params);
  }
}

class GetClientsAcceptParams {
  final int skip;
  final int? limit;
  final String? fkRegion;
  final String fkCountry;
  final String? filter;

  const GetClientsAcceptParams({
    required this.skip,
    this.limit,
    required this.fkCountry,
    this.fkRegion,
    this.filter,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'fk_regoin': fkRegion,
      'fk_country': fkCountry,
      'filter': filter,
    };
  }
}
