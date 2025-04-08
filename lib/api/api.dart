import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../core/services/api/api_services.dart';
import '../core/services/cache_services/cache_services.dart';
import '../core/services/cache_services/secure_storage_consumer.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/app_strings.dart';
import 'http_interceptors.dart';

@lazySingleton
class Api {
  static final http.Client _client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  static String? token;
  static final Api _instance = Api._internal();
  late final enc.Key _encryptionKey;
  late final enc.IV _encryptionIV;

  factory Api() {
    return _instance;
  }

  Api._internal() {
    if (token == null) getToken();
    _initializeEncryption();

  }

  Future<void> getToken() async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    token = await secureStorage.getData(key: AppStrings.secureStorage.token);
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



  Future<dynamic> get({
    required String url,
    bool returnPureData = false,
  }) async {


    http.Response response = await _client.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'AuthToken': 'Bearer $token',
      'platform': 'mobile',

    });
    debugPrint('token in get');
    debugPrint(token);

    if (returnPureData) {
      return response;
    }
    if (json.decode(response.body)["code"] == "200") {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception('${json.decode(response.body)["code"] == "200"}');
    }
  }


  Future<dynamic> post({
    required String url,
    @required dynamic body,
  }) async {
    try {
      ApiServices apiServices = getIt<ApiServices>();
      final result = await apiServices.post(endPoint: url,
      data: body);
      return result;


      // Map<String, String> headers = {
      //   'platform': 'mobile',
      //   "content-type": "application/x-www-form-urlencoded; charset=utf-8",
      // };
      //
      // if (token != null) {
      //   headers.addAll({'AuthToken': 'Bearer $token'});
      // }
      // dynamic encryptedData ;
      //
      // if(!isPhpUrl(url)){
      //   if(body!=null) {
      //     if (body is Map) {
      //       encryptedData = _encryptNestMap(body);
      //     } else {
      //       encryptedData = _encryptValue(body);
      //     }
      //     print(encryptedData.toString());
      //   }
      //
      // }
      //
      // debugPrint('headers : ' + headers.toString());
      // http.Response response = await _client.post(
      //   Uri.parse(url),
      //   body: isPhpUrl(url)
      //       ? body!=null?body.toString():null
      //       : encryptedData==null?null:encryptedData,
      //   headers: headers,
      // );
      // String result = response.body;
      // int idx = result.indexOf("{");
      // int length = result.length;
      // result = result.substring(idx, length);
      //
      // if (json.decode(result)["code"].toString() == "200") {
      //   print(jsonDecode(result)["message"]);
      //   return jsonDecode(result)["message"];
      // } else {
      //   throw Exception('${json.decode(result)["message"]}');
      // }
    }catch(e){
      print(e.toString());
    }
  }

  Future<File?> checkExist(String filename) async {
    String dir = (await getDownloadsDirectory())!.path;
    File file = File('$dir/$filename');
    final isExist = file.existsSync();
    if (isExist) return file;
    return null;
  }

  Future<File> downloadFile(String url, String filename) async {
    final File generatedFile = await _generateFileInDevice(filename: filename);

    // fetch the file by the url
    final Uint8List fetchedFileBytes = await _fetchFileFromApi(url);
    // write the bytes from the fetched file to the local file
    final file = await _writeBytesToFile(
      bytes: fetchedFileBytes,
      file: generatedFile,
    );

    return file;
  }

  Future<Uint8List> _fetchFileFromApi(String url) async {
    HttpClient httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }

  Future<File> _generateFileInDevice({
    required String filename,
  }) async {
    Directory? dir = await getDownloadsDirectory();

    if (dir == null) {
      await dir?.create(recursive: true);
    }

    bool isDirExist = dir?.existsSync() ?? false;
    if (!isDirExist) {
      dir = await getApplicationDocumentsDirectory();
    }

    final String fullTargetPath = '${dir!.path}/$filename';

    File file = await _createFileFromUrl(url: fullTargetPath);

    return file;
  }

  Future<File> _createFileFromUrl({
    required String url,
  }) async {
    final File file = File(url);
    final bool isExist = await file.exists();
    if (isExist) return file;
    return await file.create(recursive: true);
  }

  Future<File> _writeBytesToFile({
    required Uint8List bytes,
    required File file,
  }) async {
    file = await file.writeAsBytes(bytes);
    return file;
  }

  Future<dynamic> delete({
    required String url,
    @required dynamic body,
  }) async {
    Map<String, String> headers = {
      'platform': 'mobile',
      'Content-Type':'multipart/form-data; boundary=<calculated when request is sent>'
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await _client.delete(
      Uri.parse(url),
    );

    String result = response.body;
    int idx = result.indexOf("{");
    int length = result.length;
    result = result.substring(idx, length);

    return jsonDecode(result)["message"];
  }
}
