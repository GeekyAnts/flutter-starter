### Flutter Starter

We wanted to take Flutter a step further and accelerate the process of building production-level apps. Presenting our solution- Flutter Starter!

![demo gif](./flutter_starter.gif)

## Introduction:

Flutter Starter, a starter kit for Flutter that helps you bootstrap projects with all the essential modules like **State Management, API calls, Style Guide, Localisation, Routes** etc. It helps you build production ready apps in a jiffy. It handles everything at one place so you don't have to rewrite code.

### Tech Stack

| Library              | Category             | Version | Description                                                                                                   |
| -------------------- | -------------------- | ------- | ------------------------------------------------------------------------------------------------------------- |
| Flutter              | Mobile Framework     | 3.0.1   | A framework for building multi-platform applications from a single codebase.                                  |
| Flutter Localization | Internationalization | 0.17.0  | Localizations for the Flutter library.                                                                        |
| BLoC                 | State Management     | 8.1.0   | This design pattern helps to separate presentation from business logic                                        |
| Flutter Bloc         | State Management     | 8.1.1   | Makes it easy to implement the BLoC design pattern                                                            |
| Http                 | Api Service          | 0.13.5  | A composable, multi-platform, Future-based API for HTTP requests.                                             |
| Http Interceptor     | Intercepting         | 1.0.2   | A simple plugin that allows you to intercept request and response objects and modify them if desired.         |
| Shared Preferences   | Storage              | 2.0.12  | Wraps platform-specific persistent storage for simple data.                                                   |
| Dio                  | State Management     | 4.0.6   | A powerful Http client for Dart.                                                                              |
| Retrofit             | Dio client Generator | 3.0.1+1 | A dio client generator using source_gen.                                                                      |
| Graphql              | Api Service          | 5.1.0   | A GraphQL client for Flutter.                                                                                 |
| Go Router            | Routing              | 4.4.1   | A declarative router for Flutter based on Navigation 2 supporting deep linking.                               |
| Bloc Test            | Testing              | 9.1.0   | A testing library which makes it easy to test blocs.                                                          |
| Mocktail             | Testing              | 0.3.0   | A Dart mock library which simplifies mocking with null safety support and no manual mocks or code generation. |

## What does Flutter Starter provide :

For the initial release flutter starter provides:

1.  **Api- Services** There are three api-services **dio**, **http** and **graphql** that have been set up if you want to provide any network method calls. We have set up an example of http in the application for signup/ login purposes but you can choose whatever you are comfortable with.

    - **Dio** : It is a powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc. [here](lib/api_sdk/dio)

    - **Http** : It is a composable, Future-based library for making HTTP requests that contains a set of high-level functions and classes that make it easy to consume HTTP resources. [here](lib/api_sdk/http)

    - **Graphql** : It is a stand-alone GraphQL client for Flutter, bringing all the features from a modern GraphQL client to one easy to use package. [here](lib/api_sdk/graphql)

2.  **State Management** For state management in the application, BLoC has been set up for basic authentication and updating themes in the app.

    - **BLoC :** Flutter bloc is quite **simple** and easy to understand, it has a very good documentation with tons of examples and also, is one of the most used in the flutter community. [here](lib/shared/bloc)

3.  **Basic Set up**

    - **Localisation**: If you build an app for different markets, you will most likely need to support multiple languages for your end-users, hence we have added localisation as a basic set up. Right now, 3 languages have been added in our localisation folder but you can add more according to your use case: English, Spanish, French. [here](lib/l10n)

    - **Routing** : An app has to display multiple screens depending upon the developer's needs. Hence we need different set of routes to display those screens. We have set up a basic file (routes.dart) in which we are demonstrating how you can set-up routes of your application. We have added **go_router** as a dependency for routing so that same application can be run on flutter_web too, but if you want you can use basic routing as well by just uncommenting the code and using it as per requirements. [here](lib/routes)

    - **Themes** : Theme of the whole application will be derived from here. A basic theme set up including interchanging of light and dark theme will be there. You can add n amount of colours, font sizes, text theme, etc to maintain the theme of your application. [here](lib/themes)

4.  **UI Screens**

    - **Sign In :** This will be the landing page of our application, for someone who already has an account registered can login directly. [here](lib/screens/login/login_screen.dart)

    - **Sign Up :** You can register yourself here. [here](lib/screens/signup/signup_screen.dart)

    - **Home :** It will contain a drawer which will have basic user information who has logged in and a switch to change between light and dark theme. [here](lib/screens/home/home.dart)

5.  **Test Cases** We have also introduced test cases in the base setup so that you can validate your UI, business logic, functionality, etc. We have set up :

    - **Unit Test Cases :** Unit tests are handy for verifying the behaviour of a single function, method, or class. [here](./test/bloc/)
    - **Integration Test Cases :** They test how individual pieces work together as a whole, or capture the performance of an application running on a real device. [here](./integration_test/app_test.dart)
    - **Widget Test Cases :** They test the UI components. It is used to test a single widget. The main goal of widget testing is to check whether the widget works as expected. [here](./test/screens/)

## What will Flutter Starter provide in later releases :

For second release we are planning to introduce one more api-service and command line interface.

1.  **Api-Services** :

    - **Firebase** : We will be providing all social authentications(Google/Twitter/Facebook etc) to the developer using firebase services.

2.  **State Management** :

    - **Provider/Riverpod** : We will be providing support for Provider/Riverpod state management templates too.

3.  **Command Line Interface** : We are aiming to provide a command line interface, so that you can easily create a project using flutter starter as the base template by just writing a command in the terminal.

4.  **Example Templates** : We will creating multiple apps template on how to use this boilerplate.

## How to use flutter starter:

To get started with flutter starter:

[Steps to get started](./use_flutter_starter.md)

## Using Flutter Starter CLI

- Flutter Starter CLI is written in the Dart programming language. It is a very useful tool that provides commands for the ease of setting up a Flutter project from scratch.
- While working with the Flutter projects we have to write the same repetitive code multiple times but using this CLI, we can create a Flutter template on the fly.
- Also, the basic structure of all the tests in Flutter is the same. So this CLI also provides a basic starter pack for the Flutter test as well.

Activate globally via:

```sh
dart pub global activate flutter_starter_cli
```

```sh
# To create project
$ flutter_starter_cli create

# Then follow instructions
```

Read more about [`Flutter Starter CLI`](https://pub.dev/packages/flutter_starter_cli).

## How to Contribute

Thank you for your interest in contributing to Flutter Starter! We are lucky to have you 🙂 Head over to [Contribution Guidelines](https://github.com/GeekyAnts/flutter-starter/blob/master/CONTRIBUTING.md) and learn how you can be a part of a wonderful, growing community.

## License

Licensed under the MIT License, Copyright © 2020 GeekyAnts.

See [LICENSE](https://github.com/GeekyAnts/flutter-starter/blob/master/LICENSE) for more information.
