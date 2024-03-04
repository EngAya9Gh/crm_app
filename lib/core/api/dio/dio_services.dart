import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_services.dart';
import '../exceptions.dart';

@LazySingleton(as: ApiServices)
class DioServices extends ApiServices {
  final Dio dio;

  DioServices(this.dio);

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
    bool isFormData = false,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.post(
        endPoint,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
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
  Future<dynamic> postRequestWithFile(
    String type,
    String url,
    Map<String, dynamic> data,
    File? file,
    File? filelogo, {
    List<File>? files,
  }) async {
    try {
      final formData = FormData.fromMap(data);
      formData..files.addAll(_getFiles(file, filelogo, files));
      final res = await dio.post(url, data: formData);
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  List<MapEntry<String, MultipartFile>> _getFiles(
      File? file, File? filelogo, List<File>? files) {
    final result = <MapEntry<String, MultipartFile>>[];
    if (file != null) {
      result.add(_mapFileToEntry("file", file));
    }
    if (filelogo != null) {
      result.add(_mapFileToEntry("filelogo", filelogo));
    }
    if (files != null) {
      result.addAll(files.asMap().entries.map((e) => _mapFileToEntry(
            "uploadfiles[${e.key}]",
            e.value,
          )));
    }
    return result;
  }

  MapEntry<String, MultipartFile> _mapFileToEntry(String key, File file) {
    return MapEntry(
      key,
      MultipartFile.fromFileSync(
        file.path,
        filename: file.path.split('/').last,
      ),
    );
  }
}
