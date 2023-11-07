class AppExceptions implements Exception {

  final dynamic message;
  final dynamic prefix;

  const AppExceptions ([this.message,this.prefix]);

  String toString() {
    return "$prefix $message";
  }
}


class FetchDataException extends AppExceptions{
  FetchDataException ([String? message]):super(message, "Error During Communication");
}
class BadRequestException extends AppExceptions{
  BadRequestException([String? message]):super(message,"Invalid Request");
}
class UnauthorizedException extends AppExceptions{
  UnauthorizedException([String? message]):super(message,"Unauthorized request");
}