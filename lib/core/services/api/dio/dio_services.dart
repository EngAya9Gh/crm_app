import 'dart:convert';

import 'package:crm_smart/core/utils/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/server_exceptions.dart';
import '../../../utils/app_strings.dart';
import '../../cache_services/cache_services.dart';
import '../../cache_services/secure_storage_consumer.dart';
import '../../di/di_container.dart';
import '../api_services.dart';
import 'file_io_stub.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

  dynamic _encrypt(dynamic value,) {
    final encryptor = enc.Encrypter(enc.AES(_encryptionKey,mode: enc.AESMode.ctr,padding: null,),);
    final encryptedData= encryptor.encrypt(value.toString(),iv: _encryptionIV).base64;
    print("-------------------------------------------------------------------------------------------------------");
    print(value);
    print(encryptedData);
    return encryptedData;
  }

  dynamic _encryptValue(dynamic value) {
    if (value is DateTime) {
      return _encrypt(value.toIso8601String());
    } else if (value is List) {
      return value.map((item) => _encryptValue(item)).toList();
    } else {
      return _encrypt(value);
    }
  }

  Map<String, dynamic> _encryptNestMap(dynamic data) {
    Map<String, dynamic> result = {};
    data.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        Map<String, dynamic> nestedResult = {};
        value.forEach((nestedKey, nestedValue) {
          nestedResult[nestedKey] = nestedValue == null ? null : _encryptValue(nestedValue);
        });
        result[key] = nestedResult;
      } else {
        result[key] = value == null ? null : _encryptValue(value);
      }
    });
    return result;

  }


  @override
  Future<dynamic> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    bool? ignoreCode =false,
  }) async {
    try {
      dynamic encryptedData ;
      Map<String, String>? encryptedQueryParameters;

      if(!isPhpUrl(endPoint)){
        if(data!=null) {
          if (data is Map) {
            encryptedData = _encryptNestMap(data);
          } else {
            encryptedData = _encryptValue(data);
          }
          print(encryptedData.toString());
        }
        if (queryParameters != null) {
          encryptedQueryParameters = queryParameters.map((key, value) =>
              MapEntry(key, _encryptValue(value))
          );
        }
      }
     if(data!=null) print("---------"+data.toString() + "---------");
     if(queryParameters!=null) print("---------"+queryParameters.toString() + "---------");
      final res = await dio.get(
        endPoint,
        data: isPhpUrl(endPoint)?data:encryptedData==null?null:encryptedData,
        queryParameters:  isPhpUrl(endPoint)?queryParameters:encryptedQueryParameters,
        options: Options(
          responseType: responseType,
          headers: {
            ...?headers,
          },
          // validateStatus: (ignoreCode??false) ? (status) => true : null,
        ),
        // cancelToken: _getCancelToken(endPoint),
      );
      print(res.toString());
      return res.data;
    } catch (e,s) {
      print(e.toString() + s.toString());
      throw handleException(e);    }
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
      Map<String, String>? encryptedQueryParameters;

      if(!isPhpUrl(endPoint)){
        if(data!=null) {
          if (data is Map) {
            encryptedData = _encryptNestMap(data);
          } else {
            encryptedData = _encryptValue(data);
          }
          print(encryptedData.toString());
        }
        if (queryParameters != null) {
          encryptedQueryParameters = queryParameters.map((key, value) =>
              MapEntry(key, _encryptValue(value))
          );
        }
      }

      final formData = data==null?null:FormData.fromMap(isPhpUrl(endPoint)?data:encryptedData);
      if(data!=null) print("---------"+data.toString() + "---------");
      if(queryParameters!=null) print("---------"+queryParameters.toString()  + "---------");
      final res = await dio.post(
        endPoint,
        data: isPhpUrl(endPoint)?formData:encryptedData==null?null:formData,
        queryParameters:  isPhpUrl(endPoint)?queryParameters:encryptedQueryParameters,
        options: Options(headers: {
          ...?headers,
        }),
        // cancelToken: _getCancelToken(endPoint),
      );
      return res.data;
    } catch (e,s) {
      print(s.toString() + e.toString());
      throw handleException(e);
    }
  }


  @override
  Future<dynamic> postRequestWithFile({
    required String endPoint,
    required dynamic data,
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
      // if (kIsWeb && files!=null) { // Check if running on the web
      //   var result = await uploadFiles(endPoint, files);
      //   return result;
      // }
        dynamic encryptedData = {};
      Map<String, String>? encryptedQueryParameters;

      if(!isPhpUrl(endPoint)){
        if(data!=null) {
          if (data is FormData) {
            var encryptedFields = Map.fromEntries(
                data.fields.map((field) => MapEntry(field.key, _encryptValue(field.value)))
            );
            encryptedData = FormData.fromMap(encryptedFields);
            encryptedData.files.addAll(data.files);
          }else if (data is Map) {
            encryptedData = _encryptNestMap(data);
          } else {
            encryptedData = _encryptValue(data);
          }
        }
        if (queryParameters != null) {
          encryptedQueryParameters = queryParameters.map((key, value) =>
              MapEntry(key, _encryptValue(value))
          );
        }
      }


      FormData formData =  FormData();
       if (data is FormData){
         formData = encryptedData;
       }else{
         formData = FormData.fromMap(isPhpUrl(endPoint)?data:encryptedData);
       }
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
        formData.fields.add(MapEntry("isDeleteFile", _encryptValue(isDeleteFile.toString())));
      }
      if (isDeleteLogo == true) {
        formData.fields.add(MapEntry("isDeleteLogo", _encryptValue(isDeleteLogo.toString())));
      }

      changeConnectionTimeout(60 * 5);
      if(data!=null) print("---------"+data.toString() + "---------");
      if(queryParameters!=null) print("---------"+queryParameters.toString() + "---------");
      final res = await dio.post(
        endPoint,
        data: formData,
        queryParameters: isPhpUrl(endPoint)?queryParameters:encryptedQueryParameters,
      );
      changeConnectionTimeout(10);

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

  Future<dynamic> uploadFiles(String url, List<XFile> files) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(EndPoints.baseUrls.urlLaravel + url));
      var token=  await getIt<CacheServices>(instanceName: SecureStorageConsumer.name,).getData(key: AppStrings.secureStorage.token);
      request.headers['content-type'] = 'multipart/form-data';
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['AuthToken'] = 'Bearer $token';
      request.headers['platform'] = 'mobile';

      for (var file in files) {
        final bytes = await file.readAsBytes();

        var multipartFile = await http.MultipartFile.fromBytes(
          'files', // The key for the file (adjust as needed)
          bytes,
          filename: file.name,
          contentType: MediaType(
              'image', 'jpeg'), // Adjust the content type as needed
        );

        request.files.add(multipartFile);
      }

      print("*********************************************");
      print(request.files.first.filename);
      print(request.files.first.contentType);
      print(request.files.first.length);
      print(request.url.toString());
      print(request.headers.toString());
      print("*********************************************");

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        print('Response data: ${responseData.body}');
        var s= jsonDecode(responseData.body) ;
        return s;
      } else {
        print('File upload failed with status: ${response.statusCode}');
        return "error";
      }
    }catch(e,s){
      print('File upload failed with status: $e $s');
      return "error";
    }
  }
  @override
  void changeBaseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }

  @override
  void changeConnectionTimeout(int seconds) {
    dio.options.connectTimeout = Duration(seconds: seconds);
    dio.options.receiveTimeout = Duration(seconds: seconds);
  }
}
