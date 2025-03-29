import 'package:dio/dio.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'home_api.g.dart';

@RestApi()
@lazySingleton
abstract class HomeApi {
  @factoryMethod
  factory HomeApi(Dio dio) = _HomeApi;
}
