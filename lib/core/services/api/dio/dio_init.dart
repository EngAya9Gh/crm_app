import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../utils/app_strings.dart';
import '../../../utils/end_points.dart';
import '../../cache_services/cache_services.dart';
import '../../cache_services/secure_storage_consumer.dart';
import '../../di/di_container.dart';

Dio dioInit() {
  final dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrls.url,
      // connectTimeout: const Duration(seconds: 10),
      // receiveTimeout: const Duration(seconds: 10),
      headers: {
        'accept': 'application/json',
      },
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
    ),
  );
  dio.interceptors.add(_ApiInterceptors());
  return dio;
}

class _ApiInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    final token =
        await secureStorage.getData(key: AppStrings.secureStorage.token);
    options.headers['AuthToken'] = 'Bearer $token';
    options.headers['Authorization'] = 'Bearer $token';

    getIt<Logger>().i(
      "Request => ${options.method} ${options.uri}\n"
      "Request headers => ${options.headers}\n"
      "Request queryParameters => ${options.queryParameters}\n"
      "${options.data is FormData ? "Request FormData fields => ${options.data.fields}" : "Request data => ${options.data}"}\n"
      "${options.data is FormData ? "Request FormData files => ${options.data.files}" : ''}",
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    getIt<Logger>().i(
      "Response => ${response.statusCode} ${response.statusMessage}\n"
      "Response url => ${response.requestOptions.uri.toString()}\n"
      "Response type => ${response.data.runtimeType}\n"
      "${response.data['count'] != null ? "Response count => ${response.data['count']}\n" : ''}"
      "Response data => ${response.data}",
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    getIt<Logger>().e(
      "Error url => ${err.requestOptions.uri}\n"
      "Error message => ${err.message}\n"
      "Error error => ${err.error}\n"
      "Error type => ${err.type}\n"
      "Error response data => ${err.response?.data}",
    );

    super.onError(err, handler);
  }
}
