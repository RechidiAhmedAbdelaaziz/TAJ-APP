import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/core/services/cache/cache.service.dart';

@lazySingleton
class HandingOverCache {
  final CacheService _cacheService;
  HandingOverCache(this._cacheService);

  Future<DataApiResponse> getConditions() async {
    //TODO change to get by key
    final json = await _cacheService.getJson(
      "assets/json/handing_over.json",
    );

    return DataApiResponse.fromJson(json);
  }
}
