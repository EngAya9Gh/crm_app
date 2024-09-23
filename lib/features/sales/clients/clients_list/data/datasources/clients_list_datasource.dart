import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ClientsListDataSource {
  // ... existing code ...

  Future<Uint8List> exportClientsToExcel(String fkCountry) async {
    final response = await http.get(
      Uri.parse('your_api_endpoint?fkCountry=$fkCountry&download=1'),
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to export clients to Excel');
    }
  }
}