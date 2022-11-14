import 'http/http_helpers/http_apis.dart';
import 'http/http_service.dart';

class ApiSdk {
  static loginWithEmailAndPassword(dynamic body) async {
    final response = await HttpService.postData(HttpApis.login, body);
    return response;
  }

  static signUpWithEmailAndPassword(dynamic body) async {
    final response = await HttpService.postData(HttpApis.register, body);
    return response;
  }

  static getUserData(int id) async {
    final response = await HttpService.getData(HttpApis.users(id));
    return response;
  }
}
