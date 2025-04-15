
import 'package:dio/dio.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'handing_over_api.g.dart';


@RestApi()
@lazySingleton
abstract class HandingOverApi {
    @factoryMethod
  factory HandingOverApi(
    Dio dio
    
) = _HandingOverApi;
}
