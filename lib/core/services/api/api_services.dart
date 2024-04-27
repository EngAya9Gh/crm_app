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

  Future<dynamic> postRequestWithFile({
    required String url,
    required Map<String, dynamic> data,
    File? file,
    File? fileLogo,
    List<File>? files,
    bool? isDeleteFile,
    bool? isDeleteLogo,
  });

  void changeBaseUrl(String baseUrl);
}
