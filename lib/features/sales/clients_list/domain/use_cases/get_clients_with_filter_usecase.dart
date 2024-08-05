import 'package:crm_smart/core/common/helpers/prepare_params_list.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../../core/utils/app_constants.dart';
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
  final int? fkUser;
  final int? activityTypeId;
  final String? activitySize;
  final String? typeClassfication;
  final String? from;
  final String? to;
  final String? clientSource;
  final String? subscribingIntentionLevel;
  final bool? isSwitchOn;

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
  });

  // GetClientsWithFilterParams copyWith({
  //   int page = 1,
  //   int? limit,
  //   String? query,
  //   String? fkCountry,
  //   int? fkRegion,
  //   String? typeClient,
  //   String? typeClient_record,
  //   int? fkUser,
  //   int? activityTypeId,
  //   String? activitySize,
  //   String? typeClassfication,
  //   String? from,
  //   String? to,
  //   String? clientSource,
  //   String? subscribingIntentionLevel,
  //   bool? isSwitchOn,
  // }) {
  //   return GetClientsWithFilterParams(
  //     page: page,
  //     limit: limit ?? this.limit ?? AppConstants.kPerPage,
  //     query: HelperFunctions.assignNullString(
  //         currentValue: this.query, newValue: query),
  //     fkCountry: fkCountry ?? this.fkCountry,
  //     fkRegion: fkRegion == 0 ? null : fkRegion ?? this.fkRegion,
  //     typeClient: HelperFunctions.assignNullString(
  //         currentValue: this.typeClient, newValue: typeClient),
  //     typeClient_record: HelperFunctions.assignNullString(
  //         currentValue: this.typeClient_record, newValue: typeClient_record),
  //     fkUser: HelperFunctions.assignNullInt(
  //         currentValue: this.fkUser, newValue: fkUser),
  //     activityTypeId: HelperFunctions.assignNullInt(
  //         currentValue: this.activityTypeId, newValue: activityTypeId),
  //     activitySize: HelperFunctions.assignNullString(
  //         currentValue: this.activitySize, newValue: activitySize),
  //     typeClassfication: HelperFunctions.assignNullString(
  //         currentValue: this.typeClassfication, newValue: typeClassfication),
  //     from: HelperFunctions.assignNullString(
  //         currentValue: this.from, newValue: from),
  //     to: HelperFunctions.assignNullString(currentValue: this.to, newValue: to),
  //     clientSource: HelperFunctions.assignNullString(
  //         currentValue: this.clientSource, newValue: clientSource),
  //     subscribingIntentionLevel: HelperFunctions.assignNullString(
  //         currentValue: this.subscribingIntentionLevel,
  //         newValue: subscribingIntentionLevel),
  //     isSwitchOn: isSwitchOn ?? this.isSwitchOn,
  //   );
  // }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      ..._prepareTypeClientList(),
      'page': page,
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
