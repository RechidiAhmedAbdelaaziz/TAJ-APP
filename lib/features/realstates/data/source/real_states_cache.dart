import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

@lazySingleton
class RealStatesCache {
  final CacheService _cacheService;
  RealStatesCache(this._cacheService);

  Future<PaginatedDataResponse> getRealStates() async {
    //TODO change to get by key
    final json = await _cacheService.getJson(
      "assets/json/real_states.json",
    );

    return PaginatedDataResponse.fromJson(json);
  }
}
