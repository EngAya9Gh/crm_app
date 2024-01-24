import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/recommended_client.dart';
import '../../../../model/similar_client.dart';

abstract class ClientsListRepository{
  Future<Result<ResponseWrapper<List<ClientModel>>>> getAllClients(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByRegion(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByUser(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsWithFilter(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<ClientModel>>> addClient(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<ClientModel>>> editClient(Map<String, dynamic> body,Map<String, dynamic> params);
  Future<Result<ResponseWrapper<ClientModel>>> changeTypeClient(Map<String, dynamic> body,Map<String, dynamic> params,String id);
  Future<Result<ResponseWrapper<ClientModel>>> approveClientReject_admin(Map<String, dynamic> body,Map<String, dynamic> params,String id);
  Future<Result<ResponseWrapper<List<RecommendedClient>>>> getRecommendedClients();
  Future<Result<ResponseWrapper<List<SimilarClient>>>> getSimilarClients(Map<String, dynamic> body);

}