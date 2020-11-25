import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.post(url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.put(url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await http.delete(url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      return BadRequestException(response.body.toString());
    case 401:
    case 403:
      return UnauthorisedException(response.body.toString());
    case 500:
    default:
      return FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
