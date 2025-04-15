import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'ticket_api.g.dart';

@RestApi()
@lazySingleton
abstract class TicketApi {
  @factoryMethod
  factory TicketApi(Dio dio) = _TicketApi;
}
