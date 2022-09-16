import 'dart:convert';
import 'dart:io';

import 'package:flutter_starter/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'http_exception.dart';

class HttpClient {
  final Client client;
  HttpClient({required this.client});
  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    bool isTokenRequired = false,
  }) async {
    http.Response? response;
    dynamic responseJson;

    try {
      response =
          await http.get(Uri.parse(baseUrl + url), headers: headers ?? {});

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {Map<String, String>? headers, Object? body}) async {
    http.Response? response;
    dynamic responseJson;
    try {
      response = await http.post(Uri.parse(baseUrl + url),
          headers: headers ?? {}, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> put(String url,
      {Map<String, String>? headers, Object? body}) async {
    http.Response? response;
    dynamic responseJson;
    try {
      response = await http.put(Uri.parse(baseUrl + url),
          headers: headers ?? {}, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    http.Response? response;
    dynamic responseJson;
    try {
      response =
          await http.delete(Uri.parse(baseUrl + url), headers: headers ?? {});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 404:
      throw FileNotFoundException(response.body.toString());
    case 500:
      throw InternalServerException(response.body.toString());
    case 502:
      throw BadGateWayException(response.body.toString());
    case 503:
      throw BadGateWayException(response.body.toString());
    default:
      return FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
