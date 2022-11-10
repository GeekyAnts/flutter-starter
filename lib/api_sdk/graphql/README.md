# GraphQL

A stand-alone GraphQL client for Flutter, bringing all the features from a modern GraphQL client to one easy to use package.

## Folders

- [graphql_helpers](./graphql_helpers/) - Contains all the information about client, queries, and variables.

### graphql_helpers

- [graphql_query.dart](./graphql_helpers/graphql_query.dart) - Contains all the graphql queries.

### graphql_api_sdk

- [graphql_service.dart](./graphql_service.dart) contains two classes GraphqlApi and GraphqlService
  - **GraphqlApi** class will create a graphql client.
  - **GraphqlService** will call the network methods.

> **Note**
> Currently, the graphql query will not work properly, the user will have to host their own graphql server and change the URL in the [graphql_service.dart](./graphql_service.dart) file.
