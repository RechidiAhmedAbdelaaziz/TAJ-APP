
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'request_api.g.dart';


@RestApi()
@lazySingleton
abstract class RequestApi {
    @factoryMethod
  factory RequestApi(
    Dio dio
    
) = _RequestApi;
}
