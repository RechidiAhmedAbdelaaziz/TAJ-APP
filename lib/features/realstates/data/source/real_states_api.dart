
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'real_states_api.g.dart';


@RestApi()
@lazySingleton
abstract class RealStatesApi {
    @factoryMethod
  factory RealStatesApi(
    Dio dio
    
) = _RealStatesApi;
}
