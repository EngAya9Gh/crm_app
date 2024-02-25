abstract class ApiServices {
  Future<dynamic> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> patch({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  void changeBaseUrl(String baseUrl);
}
