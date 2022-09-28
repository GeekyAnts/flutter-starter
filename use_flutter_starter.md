## How to use flutter starter :

To get started with flutter starter:

1. Clone the flutter-starter repository from GitHub or click on the use-template button to create an initial template for your project.

2. Below is the folder structure of the template that will be created

[**Folder Structure :**](./folder_structure.md)

3.  To add an image or any asset there is a folder named **assets** in the app folder at root location, you can add images under **assets/ images/** and if you want to add google fonts or custom fonts you can create a folder named **fonts** under **assets/**

4.  We have added localisation as a basic set up. Right now, 3 languages have been added in our localisation folder but you can add more according to your use case: English, Spanish, French. [here](lib/l10n)

```

return MaterialApp.router(

...

localizationsDelegates: const [

AppLocalizations.delegate,

GlobalMaterialLocalizations.delegate,

GlobalCupertinoLocalizations.delegate,

GlobalWidgetsLocalizations.delegate,

],

supportedLocales: AppLocalizations.supportedLocales,

locale: const Locale('fr'),

);

```

5.  We have added **go_router** as a dependency for routing so that same application can be run on flutter_web too, but if you want you can use basic routing as well by just uncommenting the code and using it as per requirements. [here](lib/routes)

```
final GoRouter router = GoRouter(

initialLocation: '/',

routes: <GoRoute>[

GoRoute(

path: '/',

builder: (BuildContext context, GoRouterState state) {

return const SplashScreen();

},

),

GoRoute(

path: '/home',

builder: (BuildContext context, GoRouterState state) {

return const HomeScreen();

},

),

GoRoute(

path: '/login',

builder: (BuildContext context, GoRouterState state) {

return const LoginScreen();

},

),

GoRoute(

path: '/signup',

builder: (BuildContext context, GoRouterState state) {

return const SignUpScreen();

},

),

],

);

```

6. There are two api-services **dio** and **http** that have been set up if you want to provide any network method calls.

- **http** : We have set up an example of http in the application for signup/ login purposes but you can choose whatever you are comfortable with. You can add more network calls in the respective files as per your use case. Below is the snippet of how you can create an http client and use it to call network methods.

```

class HttpApi {

HttpApi._internal();

static final _singleton = HttpApi._internal();

factory HttpApi() => _singleton;

static Client createHttp() {

Client httpClient = InterceptedClient.build(interceptors: [

HttpInterceptor(),

]);

return httpClient;

}

}

```

```
class  HttpInterceptor  extends  InterceptorContract {

@override

Future<RequestData> interceptRequest({required  RequestData  data}) {

// triggers before the http request is called

throw  UnimplementedError();

}



@override

Future<ResponseData> interceptResponse({required  ResponseData  data}) {

// triggers after the request is called

throw  UnimplementedError();

}

}
```

```

class HttpService {

static getData(String url) async {

final client = HttpClient(client: HttpApi.createHttp());

final response = await client.get(url);

return response;

}



static postData(String url, dynamic body) async {

final client = HttpClient(client: HttpApi.createHttp());

final response = await client.post(url, body: body);

return response;

}

static putData(String url, dynamic body) async {

final client = HttpClient(client: HttpApi.createHttp());

final response = await client.put(url, body: body);

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

- **dio** : We have set up base for calling network methods using dio. You can add more network calls in the respective files as per your use case. Below is the snippet of how you can create a dio client and use it to call network methods.

```

class  DioApi {

DioApi._internal();

static  final  _singleton  =  DioApi._internal();

factory  DioApi() => _singleton;

static  Dio  createDio() {

var  dio  =  Dio(BaseOptions(

receiveTimeout:  15000,

connectTimeout:  15000,

sendTimeout:  15000,

));

dio.interceptors.addAll({

DioInterceptor(),

});

return  dio;

}

}

```

```
class  DioInterceptor  extends  Interceptor {

@override

void  onRequest(RequestOptions  options, RequestInterceptorHandler  handler) {

// Do something before request is sent.

super.onRequest(options, handler);

}

@override

void  onResponse(Response  response, ResponseInterceptorHandler  handler) {

// Do something with the response data.

super.onResponse(response, handler);

}



@override

void  onError(DioError  err, ErrorInterceptorHandler  handler) {

// Do something with the response error.

_handleError(err);

super.onError(err, handler);

}

_handleError(DioError  err) {

switch (err.type) {

case  DioErrorType.connectTimeout:

case  DioErrorType.receiveTimeout:

case  DioErrorType.sendTimeout:

throw  TimeOutException(err.message, err.requestOptions);

case  DioErrorType.response:

switch (err.response?.statusCode) {

case  400:

throw  BadRequestException(

err.error.toString(),

err.requestOptions,

);

case  401:

throw  UnauthorisedException(

err.error.toString(),

err.requestOptions,

);

case  403:

throw  UnauthorisedException(

err.error.toString(),

err.requestOptions,

);

case  404:

throw  FileNotFoundException(

err.error.toString(),

err.requestOptions,

);

case  500:

throw  InternalServerException(

err.error.toString(),

err.requestOptions,

);

case  502:

throw  BadGateWayException(

err.error.toString(),

err.requestOptions,

);

case  503:

throw  BadGateWayException(

err.error.toString(),

err.requestOptions,

);

}

break;

case  DioErrorType.other:

throw  ConnectionException(

'Please check your network connection',

err.requestOptions,

);

default:

throw  err;

}

}

}

@override

Future<ResponseData> interceptResponse({required  ResponseData  data}) {

// triggers after the request is called

throw  UnimplementedError();

}

}
```

```

class  DioService {

static  getUserData(int  id) async {

final  client  =  DioClient(DioApi.createDio());

final  response  =  await  client.getUsers(id);

return  response;

}

static  postUserData(dynamic  body) async {

final  client  =  DioClient(DioApi.createDio());

final  response  =  await  client.createPost(body);

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
abstract  class  UpdateThemeState  extends  Equatable {

const  UpdateThemeState();

@override

List<bool> get  props => [];

}



class  SetTheme  extends  UpdateThemeState {

final  bool  isLightTheme;

const  SetTheme({required  this.isLightTheme});

@override

List<bool> get  props => [isLightTheme];

}
```

```
abstract  class  UpdateThemeEvent  extends  Equatable {

const  UpdateThemeEvent();



@override

List<bool> get  props => [];

}



class  UpdateTheme  extends  UpdateThemeEvent {

final  bool  isLightTheme;

const  UpdateTheme({required  this.isLightTheme});



@override

List<bool> get  props => [isLightTheme];

}
```

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

10. Run command `flutter run` to get started 🥳
