import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../utils/app_strings.dart';
import '../../../utils/end_points.dart';
import '../../cache_services/cache_services.dart';
import '../../cache_services/secure_storage_consumer.dart';
import '../../di/di_container.dart';

class DioInit {
  static Dio dioInit() {
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
}

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
    // prepare request headers
    // todo: fetch the token once at the start of the app and store it in memory
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    final token =
        await secureStorage.getData(key: AppStrings.secureStorage.token);
    options.headers['AuthToken'] = 'Bearer $token';
    options.headers['Authorization'] = 'Bearer $token';

    // print all request data
    getIt<Logger>().i("Request: ${options.method} ${options.uri}");
    getIt<Logger>().i("Request headers: ${options.headers}");
    if (options.data is FormData) {
      getIt<Logger>().i("Request FormData: ${options.data.fields}");
    } else {
      getIt<Logger>().i("Request data: ${options.data}");
    }
    getIt<Logger>().i("Request queryParameters: ${options.queryParameters}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    getIt<Logger>()
        .i("Response: ${response.statusCode} ${response.statusMessage}");
    getIt<Logger>()
        .i("Response url: ${response.requestOptions.uri.toString()}");
    getIt<Logger>().i("Response data: ${response.data}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    getIt<Logger>().e("Error url => ${err.requestOptions.uri}");
    getIt<Logger>().e("Error message => ${err.message}");
    getIt<Logger>().e("Error error => ${err.error}");
    getIt<Logger>().e("Error type => ${err.type}");
    getIt<Logger>().e("Error response data => ${err.response?.data}");

    super.onError(err, handler);
  }
}
