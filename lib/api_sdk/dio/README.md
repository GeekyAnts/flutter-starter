# Dio

A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.

## Folders

- dio_helpers (Contains all the information about base urls, api calls and exception handling)
- models. (Contains the user model and an auto generated Json serializable file)

### dio_helpers

- [dio_apis.dart](api_sdk/dio/dio_helpers/dio_apis.dart) - Contains all the api tags.
- [dio_client.dart](api_sdk/dio/dio_helpers/dio_client.dart) - DioClient class is responsible for handling all the network call methods.
- [dio_interceptor.dart](api_sdk/dio/dio_helpers/dio_interceptor.dart) - DioInterceptor can intercept requests/responses/errors before they are handled by then or catchError.
- [dio_exceptions.dart](api_sdk/dio/dio_helpers/dio_exceptions.dart) - DioExceptions handles all the exceptions for different error codes.

### models

- [user_model.dart](api_sdk/dio/models/user_model.dart) - A data class that contains the serialized form of a user model.

### dio_api_sdk

Contains two classes DioApi and DioService that will eventually call the network methods. **DioApi** class will create a dio instance which will have interceptors added to it. **DioService** will eventually call the network methods present in [dio_service.dart](api_sdk/dio/dio_service.dart)
