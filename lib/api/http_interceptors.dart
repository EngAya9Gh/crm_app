import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../core/services/cache_services/cache_services.dart';
import '../core/services/cache_services/secure_storage_consumer.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/app_strings.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    var token =
        await secureStorage.getData(key: AppStrings.secureStorage.token);
    token = '1174|5Tc3fqFtTgjb8yfjfJAF9JVWynKSZWu3lmoKoJNsf9f73437';

    data.headers['AuthToken'] = 'Bearer $token';
    data.headers['Authorization'] = 'Bearer $token';

    debugPrint('HTTP Request*************************************');
    debugPrint('headers => ${data.headers}');
    debugPrint('${data.method.name} => ${data.url}');
    debugPrint('query params => ${data.params}');
    debugPrint('body => ${data.body}');
    debugPrint("HTTP End Request*************************************");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('HTTP Response*************************************');
    debugPrint('headers => ${data.headers}');
    debugPrint('url => ${data.url}');
    debugPrint('body is ${data.body.runtimeType} => ${data.body}');
    debugPrint("HTTP End Response*************************************");
    return data;
  }
}
