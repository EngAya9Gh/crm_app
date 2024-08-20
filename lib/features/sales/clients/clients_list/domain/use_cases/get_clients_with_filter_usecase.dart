import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/calculate_page.dart';
import '../../../../../../core/common/helpers/prepare_params_list.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetClientsWithFilterUserUsecase
    extends UseCase<Either<String, dynamic>, GetClientsWithFilterParams> {
  GetClientsWithFilterUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, dynamic>> call(GetClientsWithFilterParams params) {
    return repository.getClientsWithFilter(params);
  }
}

class GetClientsWithFilterParams {
  final int page;
  final int? limit;
  final String? query;
  final String fkCountry;
  final int? fkRegion;
  final List<String?>? typeClient;
  final String? typeClient_record;
  final String? fkUser;
  final int? activityTypeId;
  final String? activitySize;
  final String? typeClassfication;
  final String? from;
  final String? to;
  final String? clientSource;
  final String? subscribingIntentionLevel;
  final bool? isSwitchOn;
  final String? cityId;

  GetClientsWithFilterParams({
    this.page = 1,
    this.limit = AppConstants.kPerPage,
    this.query,
    required this.fkCountry,
    this.fkRegion,
    this.typeClient,
    this.typeClient_record,
    this.fkUser,
    this.activityTypeId,
    this.activitySize,
    this.typeClassfication,
    this.from,
    this.to,
    this.clientSource,
    this.subscribingIntentionLevel,
    this.isSwitchOn,
    this.cityId,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      ..._prepareTypeClientList(),
      'page': calculatePage(skip: page, limit: limit),
      'limit': limit,
      'fk_country': fkCountry,
      'fk_regoin': fkRegion,
      'type_record': typeClient_record,
      'fk_user': fkUser,
      'activity_type_fk': activityTypeId,
      'size_activity': activitySize,
      'typeClassfication': typeClassfication,
      'from': from,
      'to': to,
      'sourcclient': clientSource,
      'priority': subscribingIntentionLevel,
      'switch': (isSwitchOn ?? false) ? "on" : null,
      'city_id': cityId,
    }..removeWhere((key, value) => value == null || value == '');
    map['filter'] = query;
    return map;
  }

  Map<String, dynamic> _prepareTypeClientList() {
    if (typeClient?.isEmpty ?? true) {
      return {};
    }

    return prepareParamsList(
      key: "type_client",
      values: typeClient!,
    );
  }
}
