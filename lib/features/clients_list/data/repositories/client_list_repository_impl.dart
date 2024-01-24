import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/clients_list/data/models/recommended_client.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/clients_list_repository.dart';
import '../data_sources/clients_list_datasource.dart';
import '../../../../model/similar_client.dart';

@Injectable(as: ClientsListRepository)
class ClientsListRepositoryImpl implements ClientsListRepository {
  final ClientsListDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getAllClients(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getAllClientsList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByRegion(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByRegionList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByUser(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByUserList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsWithFilter(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getAllClientsWithFilterList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<RecommendedClient>>>> getRecommendedClients() {
    return toApiResult(datasource.getRecommendedClients);
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> addClient(Map<String, dynamic> body) {
    return toApiResult(() => datasource.addClient(body));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> editClient(Map<String, dynamic> body, Map<String, dynamic> params) {
    return toApiResult(() => datasource.editClient1(body, params));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> changeTypeClient(Map<String, dynamic> body, Map<String, dynamic> params,String id) {
    // TODO: implement changeTypeClient
    return toApiResult(() => datasource.changeTypeClient(body, params,id));

  }

  @override
  Future<Result<ResponseWrapper<List<SimilarClient>>>> getSimilarClients(Map<String, dynamic> body) {
    // TODO: implement getSimilarClients
    return toApiResult(() => datasource.getSimilarClientsList(body));

  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> approveClientReject_admin(Map<String, dynamic> body, Map<String, dynamic> params, String id) {
    // TODO: implement approveClientReject_admin
    return toApiResult(() => datasource.approveClient_Reject(body,params,id));
  }
}
