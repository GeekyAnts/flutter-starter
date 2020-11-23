import 'package:api_sdk/api_constants.dart';
import 'package:api_sdk/rest/rest_api_handler_data.dart';

class ApiSdk {
  static loginWithEmailAndPassword(dynamic body) async {
    final response = await RestApiHandlerData.postData(
        '${apiConstants["auth"]}/login', body);
    return response;
  }

  static signUpWithEmailAndPassword(dynamic body) async {
    final response = await RestApiHandlerData.postData(
        '${apiConstants["auth"]}/register', body);
    return response;
  }

  static getUserData(int id) async {
    final response =
        await RestApiHandlerData.getData('${apiConstants["auth"]}/users/$id');
    return response;
  }

  static fetchTopId() async {
    final response = await RestApiHandlerData.getData(
        '${apiConstants["hacker_news"]}/topstories.json');
    return response;
  }

  static fetchItems(int id) async {
    final response = await RestApiHandlerData.getData(
        '${apiConstants["hacker_news"]}/item/$id.json');
    return response;
  }
}
