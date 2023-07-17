class AppException  implements Exception{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

// Custom exceptions
class InternetException extends AppException{
  InternetException([String? message]):super(message,"No internet ");
}
class RequestTimeOutException extends AppException{
  RequestTimeOutException([String? message]):super(message,"Taking too much time ");
}
class ServerException extends AppException{
  ServerException([String? message]):super(message,"Internal Exception ");
}
class FetchDataException extends AppException{
  FetchDataException([String? message]):super(message,"Error During communication ");
}
class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,"Invalid request ");
}
class UnAuthorisedException extends AppException{
  UnAuthorisedException([String? message]):super(message,"UnAuthorised requst ");
}
class InvalidInputException extends AppException{
  InvalidInputException([String? message]):super(message,"Invalid Input ");
}