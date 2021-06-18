import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gql/language.dart';
import 'package:graphql/client.dart';
import 'package:api_sdk/graphql_method/graphql_operation/mutations/mutations.dart'
    as mutations;
import 'package:api_sdk/graphql_method/graphql_operation/queries/readRepositories.dart'
    as queries;

class GraphqlQlHandler {
  final GraphQLClient client;

  GraphqlQlHandler({@required this.client}) : assert(client != null);

  Future<QueryResult> getRepositories(int numOfRepositories) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: parseString(queries.readRepositories),
      variables: <String, dynamic>{
        'nRepositories': numOfRepositories,
      },
      pollInterval: 4,
      fetchResults: true,
    );

    return await client.query(_options);
  }

  Future<QueryResult> toggleRepoStar(dynamic repo) async {
    var document =
        repo.viewerHasStarred ? mutations.removeStar : mutations.addStar;

    final MutationOptions _options = MutationOptions(
      documentNode: parseString(document),
      variables: <String, String>{
        'starrableId': repo.id,
      },
    );

    return await client.mutate(_options);
  }
}
