import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/di/di_container.dart';
import 'http_interceptors.dart';

@lazySingleton
class Api {
  static final http.Client _client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  // final client = RetryClient(http.Client());
  // headers: {
  // "Accept": "application/json",
  // "Access-Control-Allow-Origin": "*"}
  static String? token = null;

  Api() {
    if (token == null) get_token();
  }

  void get_token() {
    final prefs = getIt<SharedPreferences>();
    token = prefs.getString('token_user');
    print('inside get_token () .... ');
  }

  Future<dynamic> get({required String url}) async {
    // final client = RetryClient(http.Client());
    // try {
    //
    // } finally {
    //   client.close();
    // }
    // http.Response response = await http.get(
    //   Uri.parse(url),
    // );
    //http.Response response = await RetryClient(http.Client()).get( Uri.parse(url));
//private, max-age=3600
    // "Cache-Control": "no-cache"
    //   http.Response response = await _client.get(
    http.Response response = await _client
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
    print('token in get');
    print(token);

    if (json.decode(response.body)["code"] == "200") {
      // print(jsonDecode(response.body)["message"]);
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
    print('headers');
    print(headers);
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

  Future<dynamic> postNew({
    required String url,
    @required dynamic body,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await _client.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    String result = response.body;
    // print(result);
    if (json.decode(result)["success"]) {
      return result;
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
    // final Directory dir = await getApplicationDocumentsDirectory();
    //
    // final String fullTargetPath = '${dir.path}/$filename';
    //
    // File file = File(fullTargetPath);
    // if (file.existsSync()) {
    //   return file;
    // }
    // file = await file.create(recursive: true);
    // final File file = File.fromUri(Uri.parse(fullPath));

    // get the path to the document directory.
    ///////////// todo: try these methods
    final File generatedFile = await _generateFileInDevice(filename: filename);
    // final File generatedFile = await _generateFileInDevice1(filename: filename);
    // final File generatedFile = await _generateFileInDevice2(filename: filename);
    // final File generatedFile = await _generateFileInDevice3(filename: filename);

    /////////////

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
    final Directory? dir = await getDownloadsDirectory();

    if (dir == null) {
      dir!.create(recursive: true);
    }

    final String fullTargetPath = '${dir.path}/$filename';

    File file = await _createFileFromUrl(url: fullTargetPath);

    return file;
  }

  Future<File> _generateFileInDevice1({
    required String filename,
  }) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    dir.create(recursive: true);

    final String fullTargetPath = '${dir.path}/$filename';

    File file = await _createFileFromUrl(url: fullTargetPath);

    return file;
  }

  Future<File> _generateFileInDevice2({
    required String filename,
  }) async {
    Directory? dir = await getDownloadsDirectory();

    if (dir == null) {
      dir = await getApplicationDocumentsDirectory();
      dir.create(recursive: true);
    }

    final String fullTargetPath = '${dir.path}/$filename';

    File file = await _createFileFromUrl(url: fullTargetPath);

    return file;
  }

  Future<File> _generateFileInDevice3({
    required String filename,
  }) async {
    Directory dir = await getApplicationDocumentsDirectory();
    dir.create(recursive: true);

    final String fullTargetPath = '${dir.path}/$filename';

    File file = await _createFileFromUrl1(url: fullTargetPath);

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

  Future<File> _createFileFromUrl1({
    required String url,
  }) async {
    if (!Platform.isIOS) {
      return _createFileFromUrl(url: url);
    }
    final File file = File.fromUri(Uri.parse(url));
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

  Future<dynamic> postCrudInvoiceFile(
      String type, String url, Map<String, dynamic> data, File? file,
      {List<File>? files}) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    if (file != null) {
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile("file", stream, length,
          filename: basename(file.path));
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
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

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
    }
    if (json.decode(result)["code"] == "200") {
      return jsonDecode(result)["message"];
    } else {
      throw Exception('${json.decode(result)["message"]}');
    }
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
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);

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

    // var response = await Dio().delete(
    //      url,queryParameters: {'fk_product':1,},
    http.Response response = await _client.delete(
      Uri.parse(url),
      //   headers:   {
      //    "Accept": "application/json",
      //    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      //
      // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
      //   'Content-Type': 'application/json; charset=UTF-8',
      //  //  "Access-Control-Allow-Headers":
      //  // "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      // // "Access-Control-Allow-Methods": "*"
      // },
    );

    String result = response.body;
    int idx = result.indexOf("{");
    int length = result.length;
    result = result.substring(idx, length);
    //if (json.decode(result)["code"] == "200") {
    /*String data="";
      if(jsonDecode(result)["message"]=="done")
        data =jsonDecode(result)["message"] ;
      else
        Map<String, dynamic>  jsonDecode(result)["message"];*/

    //   return jsonDecode(result)["message"];
    // } else {
    //
    //   throw Exception(
    //       '${json.decode(result)["message"]}');
    // }
    return jsonDecode(result)["message"];
  }
}
