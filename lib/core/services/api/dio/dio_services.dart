import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/server_exceptions.dart';
import '../api_services.dart';
import 'file_io_stub.dart';
import 'package:encrypt/encrypt.dart' as enc;

@Singleton(as: ApiServices)
class DioServices extends ApiServices {
  final Dio dio;
  final Map<String, CancelToken> _cancelTokens = {};
  late final enc.Key _encryptionKey;
  late final enc.IV _encryptionIV;

  DioServices(this.dio) {
    _initializeEncryption();
  }
  CancelToken _getCancelToken(String endpoint) {
    if (_cancelTokens.containsKey(endpoint)) {
      _cancelTokens[endpoint]!.cancel('Cancelled due to new request');
    }
    final cancelToken = CancelToken();
    _cancelTokens[endpoint] = cancelToken;
    return cancelToken;
  }

  bool isPhpUrl(String url) {
    return url.toLowerCase().contains('.php');
  }

  void _initializeEncryption() {
    const String keyString = 'sM@rtCrM!2025#Key@For@Encryption';
    _encryptionKey = enc.Key.fromUtf8(keyString);
    _encryptionIV =  enc.IV.fromBase64("LC06wiNMr2WRaULJkERwdA==") ;
  }

  String _encrypt(dynamic data,) {
    final encryptor = enc.Encrypter(enc.AES(_encryptionKey,mode: enc.AESMode.ctr,),);
    final encryptedData= encryptor.encrypt(json.encode(data),iv: _encryptionIV).base64;
    print("-------------------------------------------------------------------------------------------------------");
    print(data);
    print(_encryptionIV.base64);
    print(encryptedData);
    print("------------------------------------------------------------------------------------------------------");
    return encryptedData;
  }
  @override
  Future<dynamic> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
  }) async {
    try {
      dynamic encryptedData ;
      if (data != null) {
        if (data is Map) {
          encryptedData = (data).map((key, value) =>
              MapEntry(key.toString(), _encrypt(value))
          );
        } else {
          encryptedData = _encrypt(data);
        }

      }
      Map<String, String>? encryptedQueryParameters;
      if (queryParameters != null) {
        encryptedQueryParameters = queryParameters.map((key, value) =>
            MapEntry(key, _encrypt(value))
        );
      }

      final res = await dio.get(
        endPoint,
        data: isPhpUrl(endPoint)?data:encryptedData,
        queryParameters:  isPhpUrl(endPoint)?queryParameters:encryptedQueryParameters,
        options: Options(
          responseType: responseType,
          headers: {
            ...?headers,
          },
        ),
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

      dynamic encryptedData ;
      if (data != null) {
        if (data is Map) {
          encryptedData = (data).map((key, value) =>
              MapEntry(key.toString(), _encrypt(value))
          );
        } else {
          encryptedData = _encrypt(data);
        }

      }
      Map<String, String>? encryptedQueryParameters;
      if (queryParameters != null) {
        encryptedQueryParameters = queryParameters.map((key, value) =>
            MapEntry(key, _encrypt(value))
        );
      }
      final res = await dio.post(
        endPoint,
        data: isPhpUrl(endPoint)?data:encryptedData,
        queryParameters:  isPhpUrl(endPoint)?queryParameters:encryptedQueryParameters,
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
    XFile? file,
    XFile? fileLogo,
    List<XFile>? files,
    bool? isDeleteFile,
    bool? isDeleteLogo,
    String? fileKey,
    String? fileLogoKey,
    String? filesKey,
    bool? isFilesKeysIndexed,
  }) async {
    try {
      final formData = FormData.fromMap(data);
      final preparedFiles = await getFiles(
        file: file,
        fileLogo: fileLogo,
        files: files,
        fileKey: fileKey,
        fileLogoKey: fileLogoKey,
        filesKey: filesKey,
        isFilesKeysIndexed: isFilesKeysIndexed,
      );

      formData..files.addAll(preparedFiles);

      if (isDeleteFile == true) {
        formData.fields.add(MapEntry("isDeleteFile", isDeleteFile.toString()));
      }
      if (isDeleteLogo == true) {
        formData.fields.add(MapEntry("isDeleteLogo", isDeleteLogo.toString()));
      }

      _changeConnectionTimeout(60 * 5);


      Map<String, String>? encryptedQueryParameters;
      if (queryParameters != null) {
        encryptedQueryParameters = queryParameters.map((key, value) =>
            MapEntry(key, _encrypt(value))
        );
      }
      final res = await dio.post(
        endPoint,
        data: formData,
        queryParameters: encryptedQueryParameters,
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
