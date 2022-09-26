### Folder Structure :

We are trying to set up a well-defined folder structure so that you can easily navigate through the application and add files wherever needed.

The current folder structure:

lib

- api_sdk
- config
- l10n (localisation)
- routes
- screens
- shared
- themes
- utils
- widgets

#### api_sdk :

This folder will contain various api services, so that you can choose between any of the mentioned services in the CLI and the folder of that specific service will be injected into api_sdk folder. Each service has its base set up and will have basic network calls in order to give a gist of how it works to the developer.

Current folder structure of api_sdk looks like:

- api_sdk

  - dio

    - dio_helpers
      - dio_apis.dart
      - dio_client.dart
      - dio_client.g.dart
      - dio_exceptions.dart
      - dio_interceptor.dart
    - models
      - user_model.dart
      - user_model.g.dart
    - dio_api_sdk.dart
    - [README.md](lib/api_sdk/dio/README.md)

  - http

    - http_helpers
      - http_client.dart
      - http_exception.dart
    - http_api_sdk.dart
    - [README.md](lib/api_sdk/http/README.md)

#### **l10n (localisation):**

If you build an app for different markets, you will most likely need to support multiple languages for your end-users, hence we have added localisation as a basic set up. Right now, 3 languages have been added in our localisation folder but you can add more according to your use case:

- English
- Spanish
- French

#### Routes**:**

An app has to display multiple screens depending upon the developer's needs. Hence we need different set of routes to display those screens. We have set up a basic file (routes.dart) in which we are demonstrating how you can set-up routes of your application. We have added **go_router** as a dependency for routing so that same application can be run on flutter_web too, but if you want you can use basic routing as well by just uncommenting the code and using it as per requirements.

#### Screens:

The whole UI of the application can be placed under this folder. For the starter kit we will be providing a basic sign in/ sign up screen along with a home screen. You can also do a fresh start by deleting all these files but since sign in/ sign up screens are almost a part of every application hence will be provided under basic UI.

Folder structure will be like :

- screens
  - home
    - home.dart
  - splash
    - splash.dart
  - signup
    - widgets
      - signup_form.dart
    - signup_screen.dart
  - login
    - widgets
      - login_form.dart
    - login_screen.dart

#### Themes:

Theme of the whole application will be derived from here. A basic theme set up including interchanging of light and dark theme will be there. You can add n amount of colours, font sizes, text theme, etc to maintain the theme of your application.

We have two files in the themes folder, one where you can set up the whole theme of the application i.e **theme_data.dart** and the other one is **color_constants.dart** where you can define all the colours that will be used in **theme_data.dart**.

#### Shared:

Shared folder will have the code for state management. At initial stage, we will be providing BLoC as the default state management library and Provider as an option for you to choose.

- **BLoC :** Flutter bloc is quite **simple** and easy to understand, it has a very good documentation with tons of examples and also, is one of the most used in the flutter community.
- **Provider** : The provider package is an easy to use package **which is basically a wrapper around the InheritedWidgets** that makes it easier to use and manage.

The folder structure will be like:

- shared
  - bloc
    - authentication
      - authentication_bloc.dart
      - authentication_event.dart
      - authentication_state.dart
    - update_theme
      - update_theme_bloc.dart
      - update_theme_state.dart
      - update_theme_event.dart
  - provider
    - authentication_provider.dart
    - base_provider.dart
    - theme_provider.dart
  - repository
    - dio_authentication_repository.dart
    - http_authentication_repository.dart

#### Utils:

Utils folder will contain the common files like **size_utils.dart** which will be responsible for the responsive UI of the application. You won’t have to use MediaQuery in every file.
