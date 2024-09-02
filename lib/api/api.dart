import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../core/services/cache_services/cache_services.dart';
import '../core/services/cache_services/secure_storage_consumer.dart';
import '../core/services/di/di_container.dart';
import 'http_interceptors.dart';

@lazySingleton
class Api {
  static final http.Client _client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  static String? token;
  static final Api _instance = Api._internal();

  factory Api() {
    return _instance;
  }

  Api._internal() {
    if (token == null) getToken();
  }

  Future<void> getToken() async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    // token = await secureStorage.getData(key: AppStrings.secureStorage.token);
    token = "Bearer 842|9h9ESUboYENXXiXIitY2LosV7tBg7Z8SZiQzEYoSb41bd67f";
  }

  Future<dynamic> get({required String url}) async {
    token = "Bearer 842|9h9ESUboYENXXiXIitY2LosV7tBg7Z8SZiQzEYoSb41bd67f";
    http.Response response = await _client.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'AuthToken': 'Bearer $token',
    });
    debugPrint('token in get');
    debugPrint(token);

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
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'AuthToken': 'Bearer $token'});
    }
    debugPrint('headers');
    debugPrint(headers.toString());
    http.Response response = await _client.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    String result = response.body;
    int idx = result.indexOf("{");
    int length = result.length;
    result = result.substring(
        idx, length); //run for login and update client and set date task
    // // String result= response.body;
    // int idx = result.indexOf("{");
    // int idxEnd = result.indexOf("}");
    // int length=result.length;
    // result=result.substring(idx,idxEnd+1);//set approve is run but set don date not run

    if (json.decode(result)["code"].toString() == "200") {
      return jsonDecode(result)["message"];
    } else {
      throw Exception('${json.decode(result)["message"]}');
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

  Future<dynamic> postRequestWithFile(String type, String url,
      Map<String, dynamic> data, File? file, File? filelogo,
      {List<File>? files}) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    if (file != null) {
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile("file", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
    }
    if (filelogo != null) {
      var length = await filelogo.length();
      var stream = http.ByteStream(filelogo.openRead());
      var multipartFile = http.MultipartFile("filelogo", stream, length,
          filename: basename(filelogo.path));
      request.files.add(multipartFile);
    }

    if (files != null) {
      for (int i = 0; i < files.length; i++) {
        final element = files[i];
        var length = await element.length();
        var stream = http.ByteStream(element.openRead());
        var multipartFile = http.MultipartFile(
            "uploadfiles[$i]", stream, length,
            filename: basename(element.path));
        request.files.add(multipartFile);
      }
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    request.headers.addAll({
      'AuthToken': 'Bearer $token',
      'Authorization': 'Bearer $token',
    });

    _logRequest(
        url: url, data: data, file: file, filelogo: filelogo, files: files);

    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);

    _logResponse(response);

    String result = '';
    if (type == 'array') {
      result = response.body;

      int idx = result.indexOf("{");
      int length = result.length;
      result = result.substring(idx, length);
    } else {
      result = response.body;

      int idx = result.indexOf("{");
      int idxEnd = result.indexOf("}");
      result = result.substring(
          idx, idxEnd + 1); //user update not run but run invoice
    } //

    if (json.decode(result)["code"] == "200") {
      return jsonDecode(result)["message"];
    } else {
      throw Exception('${json.decode(result)["message"]}');
    }
  }

  Future<dynamic> delete({
    required String url,
    @required dynamic body,
  }) async {
    Map<String, String> headers = {};
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

  void _logRequest({
    required String url,
    required Map<String, dynamic> data,
    File? file,
    File? filelogo,
    List<File>? files,
  }) {
    debugPrint('HTTP Request*************************************');
    debugPrint('url: $url');
    debugPrint('data: $data');
    debugPrint('file: $file');
    debugPrint('filelogo: $filelogo');
    debugPrint('files: $files');
    debugPrint("HTTP End Request*************************************");
  }

  void _logResponse(http.Response response) {
    debugPrint('HTTP Response*************************************');
    debugPrint('statusCode: ${response.statusCode}');
    debugPrint('body: ${response.body}');
    debugPrint("HTTP End Response*************************************");
  }
}
