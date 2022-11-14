import 'graphql/graphql_helpers/graphql_query.dart';
import 'graphql/graphql_service.dart';

class ApiSdk {
  static loginWithEmailAndPassword(dynamic variables) async {
    final response =
        await GraphqlService.getQuery(GraphqlQuery.login, variables);
    return response.data['login'];
  }

  static signUpWithEmailAndPassword(dynamic variables) async {
    final response =
        await GraphqlService.getQuery(GraphqlQuery.register, variables);
    return response.data['register'];
  }

  static getUserData(int id) async {
    final response =
        await GraphqlService.getQuery(GraphqlQuery.users, {"id": id});
    return response.data['user'];
  }
}
