import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

@lazySingleton
class TicketCache {
  final CacheService _cacheService;
  TicketCache(this._cacheService);

  Future<PaginatedDataResponse> getTicket({
    required String stateId,
  }) async {
    //TODO change to get by key
    final json = await _cacheService.getJson(
      "assets/json/tickets_$stateId.json",
    );

    return PaginatedDataResponse.fromJson(json);
  }
}
