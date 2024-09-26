// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import '../../domain/use_cases/get_clients_with_filter_usecase.dart';
//
// class ClientsListDatasource {
//   final Dio _dio;
//
//   ClientsListDatasource(this._dio);
//
//   Future<List<int>> exportClientsToExcel(GetClientsWithFilterParams params) async {
//     try {
//       final response = await _dio.post(
//         'your_api_endpoint/export_clients_to_excel',
//         data: params.toJson(),
//         options: Options(
//           responseType: ResponseType.bytes,
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to export clients to Excel');
//       }
//     } on DioException catch (e) {
//       print('⛔ Error message => ${e.message}');
//       print('⛔ Error error => ${e.error}');
//       print('⛔ Error type => ${e.type}');
//       print('⛔ Error response data => ${e.response?.data}');
//       throw Exception('Network error occurred while exporting clients to Excel');
//     } catch (e) {
//       print('Unknown error: $e');
//       throw Exception('Unknown error occurred while exporting clients to Excel');
//     }
//   }
// }