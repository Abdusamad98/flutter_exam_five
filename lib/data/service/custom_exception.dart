import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  BadRequestException({required super.requestOptions});

  @override
  String toString() => "Invalid request";
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException({required super.requestOptions});

  @override
  String toString() => "Unknown error occurred, please try again later";
}

class ConflictException extends DioError {
  ConflictException({required super.requestOptions});
  @override
  String toString() => "Confilct occurred";
}

class NotFoundException extends DioError {
  NotFoundException({required super.requestOptions});

  @override
  String toString() => "The requested information could not be found";
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException({required super.requestOptions});

  @override
  String toString() => "No internet connection detected, please try again";
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException({required super.requestOptions});

  @override
  String toString() => "The connection has timed out, please try again.";
}
