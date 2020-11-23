//For the graphql.
import 'package:graphql/client.dart';

OptimisticCache cache = OptimisticCache(
  dataIdFromObject: typenameDataIdFromObject,
);
GraphQLClient client() {
  final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AuthLink(
    getToken: () => 'Bearer YOUR GITHUB ACCESS TOKEN',
  );

  final Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    cache: cache,
    link: _link,
  );
}

//For the Rest
Map<String, String> apiConstants = {"auth": "https://reqres.in/api"};
