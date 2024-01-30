import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/enums/status_code.dart';
import 'api_utils.dart';

enum _StatusType {
  succeed,
  failed,
}

class LoggerInterceptor extends Interceptor with LoggerHelper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{

   final prefs = await SharedPreferences.getInstance();
   final token= prefs.getString('token_user');
   print('token inside interceptor');
   print(token);
    options.headers['AuthToken'] = 'Bearer '+token.toString();//'Bearer 20|PLueBlgrb1VT4p2QMIOVNxuAXpTifd5BCNtFDgFq48af1845';
//HttpHeaders.authorizationHeader
    if (kDebugMode) {
      prettyPrinterI(
        "***|| INFO Request ${options.path} ||***"
        "\n HTTP Method: ${options.method}"
        // "\n token : ${options.headers[HttpHeaders.authorizationHeader]?.substring(0, 20)}"
        "\n query param : ${options.queryParameters}"
        "\n body : ${options.data is FormData ? (options.data as FormData).fields : options.data}"
        "\n url: ${options.path}"
        "\n Header: ${options.headers}"
        "\n timeout: ${options.connectTimeout! ~/ 1000}s",
      );
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      _StatusType statusType;
      if (response.statusCode == StatusCode.operationSucceeded.code) {
        statusType = _StatusType.succeed;
      } else {
        statusType = _StatusType.failed;
      }
      final requestRoute = response.requestOptions.path;

      if (statusType == _StatusType.failed) {
        prettyPrinterError('***|| ${statusType.name.toUpperCase()} Response into -> $requestRoute ||***');
      } else {
        prettyPrinterV('***|| ${statusType.name.toUpperCase()} Response into -> $requestRoute ||***');
      }
      prettyPrinterWtf(
        "***|| INFO Response Request $requestRoute ${statusType == _StatusType.succeed ? '✊' : ''} ||***"
        "\n Status code: ${response.statusCode}"
        "\n Status message: ${response.statusMessage}"
        "\n Data: ${response.data}",
      );
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      prettyPrinterError(
        "***|| SOMETHING ERROR 💔 ||***"
        "\n error: ${err.error}"
        "\n status code: ${err.response?.statusCode}"
        "\n response: ${err.response}"
        "\n message: ${err.message}"
        "\n type: ${err.type}"
        "\n stackTrace: ${err.stackTrace}",
      );
    }

    final data = err.response?.data;
    if (data != null && data != "") {
      if (data is Map<String, dynamic>) {
        showMessage(data['message']);
      } else {
        showMessage('Something went wrong!!');
      }
    }

    handler.next(err);
  }
}

mixin LoggerHelper {
  void prettyPrinterError(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).e(message);
  }

  void prettyPrinterWtf(final String message) {
    Logger(
      printer: PrettyPrinter(methodCount: 0),
      level: Level.fatal,
    ).f(message);
  }

  void prettyPrinterI(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).i(message);
  }

  void prettyPrinterV(final String message) {
    Logger(
      printer: PrettyPrinter(methodCount: 0),
      level: Level.trace,
    ).t(message);
  }
}
