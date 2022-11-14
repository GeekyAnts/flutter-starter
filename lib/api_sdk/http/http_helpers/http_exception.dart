class HttpException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  HttpException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends HttpException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class FileNotFoundException extends HttpException {
  FileNotFoundException([String? message]) : super(message, "File not found: ");
}

class InternalServerException extends HttpException {
  InternalServerException([String? message])
      : super(message, "Internal Server Exception: ");
}

class BadGateWayException extends HttpException {
  BadGateWayException([String? message])
      : super(message, "Bad Gateway Exception: ");
}
