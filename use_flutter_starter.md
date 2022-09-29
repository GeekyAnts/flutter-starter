## How to use flutter starter :

To get started with flutter starter:

1. Clone the flutter-starter repository from GitHub or click on the use-template button to create an initial template for your project.

2. Below is the folder structure of the template that will be created

[**Folder Structure :**](./folder_structure.md)

3.  To add an image or any asset there is a folder named **assets** in the app folder at root location, you can add images under **assets/ images/** and if you want to add google fonts or custom fonts you can create a folder named **fonts** under **assets/**

4.  We have added localisation as a basic set up. Right now, 3 languages have been added in our localisation folder but you can add more according to your use case: English, Spanish, French. [here](lib/l10n). And if you want to change the language as per your choice you can provide a constant value to the locale parameter inside the MaterialApp widget.

```

return MaterialApp.router(
...
locale: const Locale('fr'),
);

```

5. We have added **go_router** as a dependency for routing so that same application can be run on flutter_web too, but if you want you can use basic routing as well by just uncommenting the code and using it as per requirements. You can add routes that you are planning to use in your application in this file. [here](lib/routes)
   Below is an example on how you can add a route and return the respective screen.

```
GoRoute(

path: '/home',

builder: (BuildContext context, GoRouterState state) {

return const HomeScreen();

},

),


```

6. There are two api-services **dio** and **http** that have been set up if you want to provide any network method calls.

- **http** : We have set up an example of http in the application for signup/ login purposes but you can choose whatever you are comfortable with. You can add more network calls in [http_client.dart](lib/api_sdk/http/http_helpers/http_client.dart) as per your use case. You can modify the http interceptor by adding methods to intercept request and response objects in [http_interceptor.dart](lib/api_sdk/http/http_helpers/http_interceptor.dart) Below is the snippet of how you can call network methods using Http service.

```

class HttpService {

static getData(String url) async {

final client = HttpClient(client: HttpApi.createHttp());

final response = await client.get(url);

return response;

}

}

```

Now let us consider, you do not want to use **http** as an api-service rather you choose **dio** then you can simply follow the below mentioned steps :

- Remove http dependency from pubspec.yaml

  ```

  http:

  http_interceptor: ^1.0.2

  ```

- Under shared folder in repository folder, remove file http_authentication_repository

- Open api_sdk.dart file and remove these three functions

```

static  loginWithEmailAndPassword(dynamic  body) async {

final  response  =  await  HttpService.postData(HttpApis.login, body);

return  response;

}

static  signUpWithEmailAndPassword(dynamic  body) async {

final  response  =  await  HttpService.postData(HttpApis.register, body);

return  response;

}

static  getUserData(int  id) async {

final  response  =  await  HttpService.getData(HttpApis.users(id));

return  response;

}

```

- Finally get rid of the http folder under api_sdk.

- **dio** : We have set up base for calling network methods using dio. You can add more network calls in [dio_client.dart](lib/api_sdk/dio/dio_helpers/dio_client.dart) as per your use case. You can modify the dio interceptor by adding methods to intercept request and response objects in [dio_interceptor.dart](lib/api_sdk/dio/dio_helpers/dio_interceptor.dart) Below is the snippet of how you can call network methods using Dio service.

```

class  DioService {

static  getUserData(int  id) async {

final  client  =  DioClient(DioApi.createDio());

final  response  =  await  client.getUsers(id);

return  response;

}

}
```

Now let us consider, you do not want to use **dio** as an api-service rather you choose **http** then you can simply follow the below mentioned steps :

- Remove dio dependency from pubspec.yaml, and since we are providing **dio's** support along with **retrofit** therefore we need to its dependency too from pubspec.yaml

  ```

  retrofit: ^3.0.1+1

  dio: ^4.0.6

  ```

- Under shared folder in repository folder, remove file dio_authentication_repository

- Open api_sdk.dart file and remove these two functions

```

static  getUserDataDio(int  id) async {

final  response  =  await  DioService.getUserData(id);

return  response;

}

static  postUserDataDio(dynamic  body) async {

final  response  =  await  DioService.postUserData(body);

return  response;

}
```

- Finally get rid of the dio folder under api_sdk.

7.  For state management in the application, BLoC has been set up for basic authentication and updating themes in the app. Below are the snippets for updating theme of the application through BLoC state management.

```
class  UpdateThemeBloc  extends  Bloc<UpdateThemeEvent, UpdateThemeState> {

UpdateThemeBloc() :  super(const  SetTheme(isLightTheme:  true)) {

on<UpdateThemeEvent>((event, emit) {

if (event  is  UpdateTheme) {

emit(SetTheme(isLightTheme:  event.isLightTheme));

}

});

}

}
```

8.  You can add n amount of colours, font sizes, text theme, etc to maintain the theme of your application.

9.  You can remove the default UI screens and do a start fresh too and integrate UI as per your requirement.

10. You can go and edit test cases as per the use case of your application:

- **Unit Test Cases :** Unit tests are handy for verifying the behaviour of a single function, method, or class. [here](./test/bloc/)

- **Integration Test Cases :** They test how individual pieces work together as a whole, or capture the performance of an application running on a real device. [here](./integration_test/app_test.dart)

- **Widget Test Cases :** They test the UI components. It is used to test a single widget. The main goal of widget testing is to check whether the widget works as expected. [here](./test/screens/)

11. Run command `flutter run` to get started 🥳
