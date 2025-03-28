import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'dio_logger.dart';
part 'auth_token_setter.dart';
part 'error_interceptor.dart';

extension DioInterceptors on Dio {
  void addLogger() => interceptors.add(_AppDioLogger.instance);

  void addAuthTokenInterceptor() =>
      interceptors.add(_AuthTokenInterceptor._());

  void addErrorInterceptor() =>
      interceptors.add(DioErrorInterceptor._());
}
