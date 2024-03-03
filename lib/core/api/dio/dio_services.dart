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
      if (file != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromFileSync(file.path,
              filename: file.path.split('/').last),
        ));
      }
      if (filelogo != null) {
        formData.files.add(MapEntry(
          "filelogo",
          MultipartFile.fromFileSync(filelogo.path,
              filename: filelogo.path.split('/').last),
        ));
      }
      if (files != null) {
        for (int i = 0; i < files.length; i++) {
          final element = files[i];
          formData.files.add(MapEntry(
            "uploadfiles[$i]",
            MultipartFile.fromFileSync(element.path,
                filename: element.path.split('/').last),
          ));
        }
      }
      final res = await dio.post(
        url,
        data: formData,
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }
}
