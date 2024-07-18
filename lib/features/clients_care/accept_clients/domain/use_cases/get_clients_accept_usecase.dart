import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/clientmodel.dart';
import '../repositories/clients_accept_repository.dart';

@lazySingleton
class GetClientsAcceptUseCase extends UseCase<
    Either<String, List<ClientModel1>>, GetClientsAcceptParams> {
  GetClientsAcceptUseCase(this._repository);

  final ClientsAcceptRepository _repository;

  @override
  Future<Either<String, List<ClientModel1>>> call(
    GetClientsAcceptParams params,
  ) async {
    return await _repository.getClientsAccept(params);
  }
}

class GetClientsAcceptParams {
  final int? page;
  final int? limit;
  final String? fkRegion;
  final String fkCountry;
  final String? filter;

  const GetClientsAcceptParams({
    this.page,
    this.limit,
    required this.fkCountry,
    this.fkRegion,
    this.filter,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'limit': limit,
      'fk_regoin': fkRegion,
      'fk_country': fkCountry,
      'filter': filter,
    };
  }
}
