import 'dart:io';

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

  Future<dynamic> postRequestWithFile(
    String type,
    String url,
    Map<String, dynamic> data,
    File? file,
    File? filelogo, {
    List<File>? files,
  });

  void changeBaseUrl(String baseUrl);
}
