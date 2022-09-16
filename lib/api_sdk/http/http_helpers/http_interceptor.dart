import 'package:http_interceptor/http_interceptor.dart';

class HttpInterceptor extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) {
    // triggers before the http request is called
    throw UnimplementedError();
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) {
    // triggers after the request is called
    throw UnimplementedError();
  }
}
