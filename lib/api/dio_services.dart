import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/app_strings.dart';

class DioServices {
  final Dio _dio = setupDio();

  static String? token;

  DioServices() {
    if (token == null) getToken();
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        options: Options(
          headers: _handleHeaders(headers),
        ),
        queryParameters: queryParameters,
      );
      if (response.statusCode != 200) {
        throw response.data;
      }
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        options: Options(
          headers: _handleHeaders(headers),
        ),
        data: data,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Map<String, dynamic> _handleHeaders(Map<String, dynamic>? headers) {
    final newHeaders = _dio.options.headers;
    newHeaders.addAll(headers ?? {});
    newHeaders['AuthToken'] = 'Bearer $token';
    return newHeaders;
  }

// setup Dio : use in service locator
  static Dio setupDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppStrings.apiBaseUrl1,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      logPrint: (Object object) {
        debugPrint(object.toString());
      },
    ));

    return dio;
  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token_user');
  }

  Dio get dio => _dio;

  void changeBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }
}
