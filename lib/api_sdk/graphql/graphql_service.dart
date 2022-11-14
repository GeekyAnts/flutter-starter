import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_helpers/graphql_config.dart';

class GraphqlApi {
  GraphqlApi._internal();

  static final _singleton = GraphqlApi._internal();

  factory GraphqlApi() => _singleton;

  static GraphQLClient createClient() {
    final HttpLink httpLink = HttpLink(baseUrl);

    final AuthLink authLink = AuthLink(getToken: () => 'Bearer $accessToken');

    final Link link = authLink.concat(httpLink);

    final GraphQLClient graphQLClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );

    return graphQLClient;
  }
}

class GraphqlService {
  static getQuery(
    String document, [
    Map<String, dynamic> variables = const {},
  ]) async {
    final graphQLClient = GraphqlApi.createClient();

    final response = await graphQLClient.query<dynamic>(
      QueryOptions<dynamic>(
        document: gql(document),
        variables: variables,
      ),
    );

    return response;
  }
}
