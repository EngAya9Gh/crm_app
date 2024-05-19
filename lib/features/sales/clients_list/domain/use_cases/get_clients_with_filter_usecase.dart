import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/sales/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/clients_list_response.dart';

@injectable
class GetClientsWithFilterUserUsecase extends UseCase<
    Either<String, List<ClientModel>>, GetClientsWithFilterParams> {
  GetClientsWithFilterUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, List<ClientModel>>> call(
      GetClientsWithFilterParams params) {
    return repository.getClientsWithFilter(params);
  }
}

class GetClientsWithFilterParams {
  final int page;
  final int? limit;
  final String? query;
  final String fkCountry;
  final String? fkRegionPrivilege;
  final int? fkRegion;
  final String? typeClient;
  final String? typeClient_record;
  final String? fkUserPrivilege;
  final int? fkUser;
  final int? activityTypeId;
  final String? typeClassfication;

  GetClientsWithFilterParams({
    required this.page,
    this.limit = AppConstants.kPerPage,
    this.query,
    required this.fkCountry,
    this.fkRegionPrivilege,
    this.fkRegion,
    this.typeClient,
    this.typeClient_record,
    this.fkUserPrivilege,
    this.fkUser,
    this.activityTypeId,
    this.typeClassfication,
  });

  //
  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'page': page,
      'limit': limit,
      'filter': query,
      'fk_country': fkCountry,
      'fk_regoin_prv': fkRegionPrivilege,
      'fk_regoin': fkRegion,
      'type_client': typeClient,
      'type_record': typeClient_record,
      'fk_user_prv': fkUserPrivilege,
      'fk_user': fkUser,
      'activity_type_fk': activityTypeId,
      'typeClassfication': typeClassfication,
    };

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

// copy with
  GetClientsWithFilterParams copyWith({
    int page = 1,
    int? limit,
    String? query,
    String fkCountry = '',
    String? fkRegionPrivilege,
    int? fkRegion,
    String? typeClient,
    String? typeClient_record,
    String? fkUserPrivilege,
    int? fkUser,
    int? activityTypeId,
    String? typeClassfication,
  }) {
    return GetClientsWithFilterParams(
      page: page,
      limit: limit ?? this.limit ?? AppConstants.kPerPage,
      query: query ?? this.query,
      fkCountry: fkCountry,
      fkRegionPrivilege: fkRegionPrivilege ?? this.fkRegionPrivilege,
      fkRegion: fkRegion ?? this.fkRegion,
      typeClient: typeClient ?? this.typeClient,
      typeClient_record: typeClient_record ?? this.typeClient_record,
      fkUserPrivilege: fkUserPrivilege ?? this.fkUserPrivilege,
      fkUser: fkUser ?? this.fkUser,
      activityTypeId: activityTypeId ?? this.activityTypeId,
      typeClassfication: typeClassfication ?? this.typeClassfication,
    );
  }
}
