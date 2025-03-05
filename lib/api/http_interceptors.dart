import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../core/services/cache_services/cache_services.dart';
import '../core/services/cache_services/secure_storage_consumer.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/app_strings.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    var token =
        await secureStorage.getData(key: AppStrings.secureStorage.token);

    request.headers['AuthToken'] = 'Bearer $token';
    request.headers['Authorization'] = 'Bearer $token';

    debugPrint('HTTP Request*************************************');
    debugPrint('headers => ${request.headers}');
    debugPrint('${request.method} => ${request.url}');
    // debugPrint('query params => ${request.params}');
    // debugPrint('body => ${request.body}');
    debugPrint("HTTP End Request*************************************");
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    debugPrint('HTTP Response*************************************');
    debugPrint('headers => ${response.headers}');
    // debugPrint('url => ${response.url}');
    // debugPrint('body is ${data.body.runtimeType} => ${data.body}');
    debugPrint("HTTP End Response*************************************");
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    // TODO: implement shouldInterceptRequest
    throw UnimplementedError();
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    // TODO: implement shouldInterceptResponse
    throw UnimplementedError();
  }
}
