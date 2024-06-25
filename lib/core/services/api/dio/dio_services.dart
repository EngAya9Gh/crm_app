import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/server_exceptions.dart';
import '../api_services.dart';

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
        options: Options(headers: {
          ...?headers,
        }),
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
  Future<dynamic> postRequestWithFile({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    File? file,
    File? fileLogo,
    List<File>? files,
    bool? isDeleteFile,
    bool? isDeleteLogo,
  }) async {
    try {
      final formData = FormData.fromMap(data);
      final preparedFiles = await _getFiles(
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

  Future<List<MapEntry<String, MultipartFile>>> _getFiles({
    File? file,
    File? fileLogo,
    List<File>? files,
  }) async {
    List<MapEntry<String, MultipartFile>> result = [];

    if (file != null) {
      result.add(_mapFileToEntry("file", file));
    }

    if (fileLogo != null) {
      result.add(_mapFileToEntry("filelogo", fileLogo));
    }

    if (files != null) {
      final preparedFiles = await _prepareFiles(files);
      result.addAll(preparedFiles.files);
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

  Future<FormData> _prepareFiles(
    List<File> files,
  ) async {
    final List<MultipartFile> multipartFiles = await Future.wait(
      files.map(
        (e) async {
          return await MultipartFile.fromFile(
            e.path,
            filename: e.path.split('/').last,
          );
        },
      ),
    );

    int index = 0;
    final FormData handledData = FormData.fromMap({
      for (final file in multipartFiles) "uploadfiles[${index++}]": file,
    });

    return handledData;
  }
}
