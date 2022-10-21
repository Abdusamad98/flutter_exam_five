import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/service/custom_exception.dart';

import 'package:flutter_exam_five/utils/constants.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: 15000,
    receiveTimeout: 15000,
  ));

  ApiClient() {
    _init();
  }
  void _init() async {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        switch (e.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
            throw DeadlineExceededException(requestOptions: e.requestOptions);
          case DioErrorType.response:
            switch (e.response?.statusCode) {
              case 400:
                throw BadRequestException(requestOptions: e.requestOptions);
              case 404:
                throw NotFoundException(requestOptions: e.requestOptions);
              case 409:
                throw ConflictException(requestOptions: e.requestOptions);
              case 500:
                throw InternalServerErrorException(
                    requestOptions: e.requestOptions);
            }
            break;
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            throw NoInternetConnectionException(
                requestOptions: e.requestOptions);
        }
        return handler.next(e);
      },
      onRequest: (options, handler) {
        options.headers["Accept"] = "application/json";
        return handler.next(options);
      },
      onResponse: (response, handler) => handler.next(response),
    ));
  }
}
