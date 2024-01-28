import 'package:crm_smart/common/constants/constants.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/nullable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class GetClientsWithFilterUserUsecase
    extends UseCase<Result<ResponseWrapper<List<ClientModel>>>, GetClientsWithFilterParams> {
  GetClientsWithFilterUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> call(GetClientsWithFilterParams params) {
    return repository.getClientsWithFilter(params.toMap());
  }
}

class GetClientsWithFilterParams {
  final String country;
  final int page;
  final int perPage;
  final int? regionId;
  final String? typeClient;
  final String? typeClient_record;
  final int? userId;
  final int? activityTypeId;
  final String? userPrivilegeId;
  final String? regionPrivilegeId;
  final String? query;

  GetClientsWithFilterParams({
    required this.country,
    required this.page,
    this.regionId,
    this.typeClient,
    this.userId,
    this.activityTypeId,
    this.userPrivilegeId,
    this.regionPrivilegeId,
    this.typeClient_record,
    this.query,
    this.perPage = kPerPage,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'fk_country': country,
      'page': page,
      'row_in_page': perPage,
      'fk_regoin': regionId,
      'type_client': typeClient,
      'type_record': typeClient_record,
      'fk_user': userId,
      'activity_type_fk': activityTypeId,
      'fk_user_prv': userPrivilegeId,
      'fk_regoin_prv': regionPrivilegeId,
      'filter': query,
    }..removeWhere((key, value) => value == null || value == '');

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  GetClientsWithFilterParams copyWith({
    Nullable<String?>? country,
    Nullable<int?>? page,
    Nullable<int?>? perPage,
    Nullable<int?>? regionId,
    Nullable<String?>? typeClient,
    Nullable<String?>? typeClient_record,
    Nullable<int?>? userId,
    Nullable<int?>? activityTypeId,
    Nullable<String?>? userPrivilegeId,
    Nullable<String?>? regionPrivilegeId,
    Nullable<String?>? query,
  }) {
    return GetClientsWithFilterParams(
      country: country != null ? country.value! : this.country,
      page: page != null ? page.value! : this.page,
      perPage: perPage != null ? perPage.value! : this.perPage,
      regionId: regionId != null ? regionId.value : this.regionId,
      typeClient: typeClient != null ? typeClient.value : this.typeClient,
      typeClient_record: typeClient_record != null ? typeClient_record.value : this.typeClient_record,
      userId: userId != null ? userId.value : this.userId,
      activityTypeId: activityTypeId != null ? activityTypeId.value : this.activityTypeId,
      userPrivilegeId: userPrivilegeId != null ? userPrivilegeId.value : this.userPrivilegeId,
      regionPrivilegeId: regionPrivilegeId != null ? regionPrivilegeId.value : this.regionPrivilegeId,
      query: query != null ? query.value : this.query,
    );
  }
}
