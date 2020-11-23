# flutter-starter-kit

A Hacker news App (boilerplate).

- To run
  Run this `bash run_script.sh` at root directory.

The api url is in `api-constants.dart`
Go to your github account and create a personal access token.

```dart
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
    getToken: () => 'Bearer YOUR GITHUB API TOKEN',
  );

  final Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    cache: cache,
    link: _link,
  );
}

//For the Rest
Map<String, String> apiConstants = {"auth": "https://reqres.in/api"};

```
To Signup use this credantials:
```
Email "eve.holt@reqres.in",
Password "pistol"
```
The demo for the app looks like this:

<img style="float: left;" src="./github_repo.gif"  height="500"/>