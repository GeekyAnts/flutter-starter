import 'package:flutter_starter/config/config.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class HttpApi {
  HttpApi._internal();

  static final _singleton = HttpApi._internal();

  factory HttpApi() => _singleton;

  static Client createHttp() {
    Client httpClient = InterceptedClient.build(interceptors: [
      HttpInterceptor(),
    ]);
    return httpClient;
  }
}

class HttpService {
  static getData(String url) async {
    final client = HttpClient(client: HttpApi.createHttp());
    final response = await client.get(url);
    return response;
  }

  static postData(String url, dynamic body) async {
    final client = HttpClient(client: HttpApi.createHttp());
    final response = await client.post(url, body: body);

    return response;
  }

  static putData(String url, dynamic body) async {
    final client = HttpClient(client: HttpApi.createHttp());
    final response = await client.put(url, body: body);
    return response;
  }
}
