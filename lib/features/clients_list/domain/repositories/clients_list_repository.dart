import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/recommended_client.dart';

abstract class ClientsListRepository{
  Future<Result<ResponseWrapper<List<ClientModel>>>> getAllClients(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByRegion(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByUser(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsWithFilter(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<RecommendedClient>>>> getRecommendedClients();
}