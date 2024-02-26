import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/di_container.dart';
import '../../utils/end_points.dart';

Dio dioInit() {
  final dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'AuthToken':
            'Bearer ${getIt<SharedPreferences>().getString('token_user')}',
      },
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
    ),
  );
  dio.interceptors.add(_ApiInterceptors());
  return dio;
}

class _ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getIt<Logger>().i("Request: ${options.method} ${options.uri}");
    getIt<Logger>().i("Request headers: ${options.headers}");
    getIt<Logger>().i("Request data: ${options.data}");
    getIt<Logger>().i("Request queryParameters: ${options.queryParameters}");

    options.headers['AuthToken'] =
        'Bearer ${getIt<SharedPreferences>().getString('token_user')}';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    getIt<Logger>()
        .i("Response: ${response.statusCode} ${response.statusMessage}");
    getIt<Logger>().i("Response headers: ${response.headers}");
    getIt<Logger>().i("Response data: ${response.data}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    getIt<Logger>().e("Error url: ${err.requestOptions.uri}");
    getIt<Logger>().e("Error message: ${err.error}");
    getIt<Logger>().e("Error type: ${err.type}");

    super.onError(err, handler);
  }
}
