import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/server_exceptions.dart';
import '../api_services.dart';
import 'file_io_stub.dart';

@Singleton(as: ApiServices)
class DioServices extends ApiServices {
  final Dio dio;
  final Map<String, CancelToken> _cancelTokens = {};

  DioServices(this.dio);

  CancelToken _getCancelToken(String endpoint) {
    if (_cancelTokens.containsKey(endpoint)) {
      _cancelTokens[endpoint]!.cancel('Cancelled due to new request');
    }
    final cancelToken = CancelToken();
    _cancelTokens[endpoint] = cancelToken;
    return cancelToken;
  }

  @override
  Future<dynamic> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.get(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          ...?headers,
        }),
        // cancelToken: _getCancelToken(endPoint),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          ...?headers,
        }),
        // cancelToken: _getCancelToken(endPoint),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future patch({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.patch(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        // cancelToken: _getCancelToken(endPoint),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var res = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        // cancelToken: _getCancelToken(endPoint),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  void changeBaseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }

  @override
  Future<dynamic> postRequestWithFile({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    dynamic file,
    dynamic fileLogo,
    List<dynamic>? files,
    bool? isDeleteFile,
    bool? isDeleteLogo,
  }) async {
    try {
      final formData = FormData.fromMap(data);
      final preparedFiles = await getFiles(
        file: file,
        fileLogo: fileLogo,
        files: files,
      );

      formData..files.addAll(preparedFiles);

      if (isDeleteFile == true) {
        formData.fields.add(MapEntry("isDeleteFile", isDeleteFile.toString()));
      }
      if (isDeleteLogo == true) {
        formData.fields.add(MapEntry("isDeleteLogo", isDeleteLogo.toString()));
      }

      _changeConnectionTimeout(60 * 5);
      final res = await dio.post(
        endPoint,
        data: formData,
        queryParameters: queryParameters,
        // cancelToken: _getCancelToken(endPoint),
      );
      _changeConnectionTimeout(10);

      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  void _changeConnectionTimeout(int seconds) {
    dio.options.connectTimeout = Duration(seconds: seconds);
    dio.options.receiveTimeout = Duration(seconds: seconds);
  }
}
