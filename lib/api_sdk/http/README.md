# Http

A composable, Future-based library for making HTTP requests that contains a set of high-level functions and classes that make it easy to consume HTTP resources.

## Folders

- http_helpers (Contains all the information about base urls, api calls and exception handling)

### http_helpers

- [http_client.dart](api_sdk/http/http_helpers/http_client.dart) - HttpClient class is responsible for handling all the network call methods.
- [http_exception.dart](api_sdk/http/http_helpers/http_exception.dart) - HttpExceptions handles all the exceptions for different error codes.
- [http_interceptor.dart](api_sdk/http/http_helpers/http_interceptor.dart) - HttpInterceptor lets you intercept the different requests and responses.

### http_api_sdk

Contains two classes HttpApi and HttpService that will eventually call the network methods. **HttpApi** class will create a client instance which will have interceptors added to it. **HttpService** will eventually call the network methods present in [http_service.dart](api_sdk/http/http_service.dart)
