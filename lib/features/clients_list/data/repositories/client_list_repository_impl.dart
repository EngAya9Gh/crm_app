import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/clients_list/data/models/recommended_client.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/clients_list_repository.dart';
import '../data_sources/clients_list_datasource.dart';

@Injectable(as: ClientsListRepository)
class ClientsListRepositoryImpl implements ClientsListRepository {
  final ClientsListDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ClientsListResponse>>>> getAllClients(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getAllClientsList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientsListResponse>>>> getClientsByRegion(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByRegionList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientsListResponse>>>> getClientsByUser(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByUserList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientsListResponse>>>> getClientsWithFilter(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getAllClientsWithFilterList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<RecommendedClient>>>> getRecommendedClients() {
    return toApiResult(datasource.getRecommendedClients);
  }

  @override
  Future<Result<ResponseWrapper<ClientsListResponse>>> addClient(Map<String, dynamic> body) {
    return toApiResult(() => datasource.addClient(body));
  }

  @override
  Future<Result<ResponseWrapper<ClientsListResponse>>> editClient(Map<String, dynamic> body, Map<String, dynamic> params) {
    return toApiResult(() => datasource.editClient(body, params));
  }
}
