import 'package:dio/dio.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

enum ClientMethod { get, post, put, delete }

class RequestConfig<T> {
  late final dynamic queryParameters;
  late final dynamic data;
  late final String endpoint;
  late final ResponseMapper<T>? response;
  late final ClientMethod clientMethod;
  late final ResponseType responseType;

  RequestConfig({
    required this.endpoint,
    this.response,
    required this.clientMethod,
    this.queryParameters,
    this.data,
    this.responseType = ResponseType.json,
  });

  @override
  String toString() {
    return 'RequestConfig{queryParameters: $queryParameters, data: $data, endpoint: $endpoint, response: $response, clientMethod: $clientMethod}';
  }
}

class ResponseMapper<T> {
  final T? value;
  final FromJson<T>? fromJson;

  ResponseMapper({this.value, this.fromJson})
      : assert(() {
          if (fromJson == null && value == null) {
            return false;
          }
          return true;
        }(), "They cannot both have a null value together");
}
