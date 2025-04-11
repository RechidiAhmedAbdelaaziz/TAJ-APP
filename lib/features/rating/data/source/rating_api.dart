
import 'package:dio/dio.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'rating_api.g.dart';


@RestApi()
@lazySingleton
abstract class RatingApi {
    @factoryMethod
  factory RatingApi(
    Dio dio
    
) = _RatingApi;
}
