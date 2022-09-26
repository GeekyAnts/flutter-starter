## How to use flutter starter :

To get started with flutter starter:

- Clone the flutter-starter repository from GitHub or click on the use-template button to create an initial template for your project.
- Below is the folder structure of the template that will be created

  [**Folder Structure :**](./folder_structure.md)

- To add an image or any asset there is a folder named assets in the app folder at root location, you can add images under assets/ images/ and if you want to add google fonts or custom fonts you can create a folder named fonts under assets/
- There are two api-services **dio** and **http** that have been set up if you want to provide any network method calls. We have set up an example of http in the application for signup/ login purposes but you can choose whatever you are comfortable with. You can add more network calls in the respective files as per your use case. Let us consider you want to use **http** as an api-service, so to remove dio from your project, simply follow the steps mentioned below :

1. Remove dio dependency from pubspec.yaml, since we have provided **dio's** support along with **retrofit** therefore you need to remove these two lines from your pubspec.yaml

```
retrofit: ^3.0.1+1
dio: ^4.0.6
```

2. Under shared folder in repository folder, remove file dio_authentication_repository

3. Open api_sdk.dart file and remove these two functions

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

4. Finally get rid of the dio folder under api_sdk.

- You can add n amount of colours, font sizes, text theme, etc to maintain the theme of your application.
- You can remove the default UI screens and do a start fresh too and integrate UI as per your requirement.
- Run command `flutter run` to get started 🥳
