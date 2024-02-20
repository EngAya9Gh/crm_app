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
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        options: Options(
          headers: {'AuthToken': 'Bearer $token'},
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
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        options: Options(
          headers: {'AuthToken': 'Bearer $token'},
        ),
        data: data,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
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

  void changeBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }
}
