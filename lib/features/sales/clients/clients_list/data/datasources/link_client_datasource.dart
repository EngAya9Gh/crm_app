import 'package:dio/dio.dart';
import '../../../../../../core/common/models/client_model.dart';

class LinkClientApiService {
  final Dio _dio;

  LinkClientApiService(this._dio);

  Future<List<ClientModel>> getLinkClients(String idClient) async {
    try {
      final response = await _dio.get('http://test.smartcrm.ws/api/getLinkClient/$idClient');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => ClientModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load linked clients');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool> linkClientTo(String idClient, List<String> ids) async {
    try {
      final response = await _dio.post(
        'http://test.smartcrm.ws/api/linkClientTo/$idClient',
        data: ids.toList(),
        // {
        //   for (int i = 0; i < ids.length; i++) 'ids[$i]': ids[i],
        // },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to link clients');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}