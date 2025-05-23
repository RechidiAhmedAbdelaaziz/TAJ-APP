import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';

part 'ticket_api.g.dart';

@RestApi()
@lazySingleton
abstract class TicketApi {
  @factoryMethod
  factory TicketApi(Dio dio) = _TicketApi;

  @GET('/api/v1/helpdesk/tickets')
  Future<MultiDataApiResponse> getTickets({
    @Query('user_id') required int userId,
  });
}
