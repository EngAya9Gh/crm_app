import 'package:image_picker/image_picker.dart';

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
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    XFile? file,
    XFile? fileLogo,
    List<XFile>? files,
    bool? isDeleteFile,
    bool? isDeleteLogo,
    String? fileKey,
    String? fileLogoKey,
    String? filesKey,
    bool isFilesKeysIndexed = false,
  });

  void changeBaseUrl(String baseUrl);
}
