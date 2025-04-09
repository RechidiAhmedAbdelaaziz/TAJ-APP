import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

@lazySingleton
class RequestCache {
  final CacheService _cacheService;
  RequestCache(this._cacheService);

  Future<PaginatedDataResponse> getRequest() async {
    //TODO change to get by key
    final json = await _cacheService.getJson(
      "assets/json/request.json",
    );

    return PaginatedDataResponse.fromJson(json);
  }
}
