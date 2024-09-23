import '../../domain/repositories/clients_list_repository.dart';
import '../../domain/use_cases/fetch_paginated_clients_usecase.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/client_model.dart';
// ... other imports

class ClientsListRepositoryImpl implements ClientsListRepository {
  // ... other methods

  @override
  Future<ResponseWrapper<List<ClientModel>>> fetchPaginatedClients(FetchPaginatedClientsParams params) async {
    try {
      final response = await _apiService.get(
        'clients/paginated',
        queryParameters: {
          'page': params.page,
          'fk_country': params.fkCountry,
          // Add any other necessary parameters
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        List<ClientModel> clients = [];

        if (responseData is List) {
          clients = responseData.map((json) => ClientModel.fromJson(json)).toList();
        } else if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
          final List<dynamic> dataList = responseData['data'];
          clients = dataList.map((json) => ClientModel.fromJson(json)).toList();
        } else {
          throw Exception('Unexpected response format');
        }

        return ResponseWrapper<List<ClientModel>>(
          data: clients,
          count: responseData['total'] ?? clients.length,
          lastPage: responseData['last_page'] ?? 1,
        );
      } else {
        throw Exception('Failed to fetch paginated clients');
      }
    } catch (e) {
      throw Exception('Error fetching paginated clients: $e');
    }
  }
}