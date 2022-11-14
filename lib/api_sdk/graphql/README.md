# GraphQL

A stand-alone GraphQL client for Flutter, bringing all the features from a modern GraphQL client to one easy-to-use package.

## Folders

- [graphql_helpers](./graphql_helpers/) - Contains all the information about the client, queries, and variables.

### graphql_helpers

- [graphql_config.dart](./graphql_helpers/graphql_config.dart) - Contains the base URL and access token.
- [graphql_query.dart](./graphql_helpers/graphql_query.dart) - Contains all the graphql queries.

### graphql_api_sdk

- [graphql_service.dart](./graphql_service.dart) contains two classes GraphqlApi and GraphqlService
  - **GraphqlApi** class will create a graphql client.
  - **GraphqlService** will call the network methods.

## Instructions

In order to use the GraphQL API service users have to host their own graphql server.
We recommend using either **Apollo Server** or **Hasura Cloud**.

### 1. Apollo Server

- Step 1: Create a new project
  ```sh
  mkdir graphql-server
  cd graphql-server
  ```
- Step 2: Install dependencies
  ```sh
  npm init --yes
  npm install @apollo/server graphql
  ```
- Step 3: Define your GraphQL schema
  ```js
  type Query {
    login(email: String!, password: String!): Login
  }
  type Login {
    token: String
  }
  ```
- Step 4: Define your data set
  ```js
  const login = {
    token: "",
  };
  ```
- Step 5: Define a resolver
  ```js
  const resolvers = {
    Query: {
      login: () => login,
    },
  };
  ```
- Step 6: Create an instance of ApolloServer
  ```js
  const server = new ApolloServer({
    typeDefs,
    resolvers,
  });
  ```
- Step 7: Prepare the server
  ```js
  const { url } = await startStandaloneServer(server, {
    listen: { port: 4000 },
  });
  ```
- Step 8: Start the server
  ```sh
  npm start
  ```
  After that, your server will be ready at 🚀 http://localhost:4000/
- Step 9: Deploy the server on Heroku (Optional)
- Step 10: Replace the local/hosted URL in the [graphql_service.dart](./graphql_service.dart) file.

### 2. Hasura Cloud

- Step 1: Create an account
  - Navigate to https://cloud.hasura.io, and create a new Hasura Cloud account.
- Step 2: Create a project
  - Select your hosting provider and create a free project.
- Step 3: Connect new/existing database
  - On the Hasura console, navigate to Data -> Manage -> Connect Database.
  - Hasura also provides a new Postgres database i.e. Neon Database.
- Step 4: Try out Hasura
  - Create the table and insert rows.
- Step 5: Launch the Console
  - Open the Hasura console and grab your base URL and access token then update credentials in the [graphql_service.dart](./graphql_service.dart) file.
