
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'notification_api.g.dart';


@RestApi()
@lazySingleton
abstract class NotificationApi {
    @factoryMethod
  factory NotificationApi(
    Dio dio
    
) = _NotificationApi;
}
