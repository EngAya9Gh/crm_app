import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('HTTP Request*************************************');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    print("HTTP End Request*************************************");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('HTTP Response*************************************');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    print("HTTP End Response*************************************");
    return data;
  }
}
